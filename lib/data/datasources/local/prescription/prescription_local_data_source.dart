// Project imports:
import 'package:kiwi/kiwi.dart';
import 'package:collection/collection.dart';
import 'package:yak/core/object_box/object_box.dart';
import 'package:yak/core/object_box/objectbox.g.dart';
import 'package:yak/data/datasources/local/medication_information/medication_information_local_data_source.dart';
import 'package:yak/data/datasources/local/medication_schedule/medication_schedule_local_data_source.dart';
import 'package:yak/data/datasources/local/pill/pill_local_data_source.dart';
import 'package:yak/data/models/medication_information/medication_information_model.dart';
import 'package:yak/data/models/medication_schedule/medication_schedule_model.dart';
import 'package:yak/data/models/prescription/prescription_create_input.dart';
import 'package:yak/data/models/prescription/prescription_model.dart';
import 'package:yak/data/models/prescription/prescription_notification_update_input.dart';
import 'package:yak/data/models/prescription/prescription_update_input.dart';
import 'package:yak/domain/entities/medication_information/medication_information.dart';
import 'package:yak/domain/entities/medication_schedule/medication_schedule.dart';
import 'package:yak/domain/entities/pill/pill.dart';
import 'package:yak/domain/entities/prescription/prescription.dart';

// Project imports:

abstract class PrescriptionLocalDataSource {
  Stream<Future<List<Prescription>>> getPrescriptions({required String userId});

  Future<PrescriptionModel> createPrescription({
    required String userId,
    required PrescriptionCreateInput createInput,
  });

  Future<PrescriptionModel> updatePrescription({
    required String userId,
    required PrescriptionUpdateInput updateInput,
  });

  Future<void> togglePrescriptionNotificaiton({
    required String userId,
    required PrescriptionNotificationUpdateInput
        prescriptionNotificationUpdateInput,
  });
}

class PrescriptionLocalDataSourceImpl
    with ObjectBoxMixin
    implements PrescriptionLocalDataSource {
  PrescriptionLocalDataSourceImpl();

  MedicationInformationLocalDataSource
      get medicationInformationLocalDataSource =>
          KiwiContainer().resolve<MedicationInformationLocalDataSource>();

  MedicationScheduleLocalDataSource get medicationScheduleLocalDataSource =>
      KiwiContainer().resolve<MedicationScheduleLocalDataSource>();

  @override
  Future<PrescriptionModel> createPrescription({
    required String userId,
    required PrescriptionCreateInput createInput,
  }) async {
    final prescriptionModel = PrescriptionModel(
      userId: userId,
      doctorName: createInput.doctorName,
      medicationStartAt: createInput.medicatedAt,
      prescriptedAt: createInput.prescriptedAt,
      duration: createInput.duration,
      medicationEndAt:
          createInput.prescriptedAt.add(Duration(days: createInput.duration)),
    );

    final id = prescriptionBox.put(prescriptionModel);

    final prescription = prescriptionBox.get(id)!;

    final medicationInformationModels =
        createInput.medicationInformationCreateInputs
            .map(
              (e) => MedicationInformationModel(
                prescriptionId: id,
                pillId: e.pillId,
                nightHour: e.nightHour,
                eveningHour: e.eveningHour,
                afternoonHour: e.afternoonHour,
                medicationCycle: e.takeCycle,
                morningHour: e.moringHour,
                takeCount: e.takeCount,
                push: e.push,
                beforePush: e.beforePush,
                afterPush: e.afterPush,
              ),
            )
            .toList();

    medicationInformationLocalDataSource.createMedicationInformations(
      prescriptionId: prescription.id,
      userId: userId,
      duration: prescription.duration,
      medicationStartAt: prescription.medicationStartAt,
      medicationInformationModels: medicationInformationModels,
    );

    return prescription;
  }

  @override
  Stream<Future<List<Prescription>>> getPrescriptions({
    required String userId,
  }) {
    final prescriptionQueryBuilder = prescriptionBox
        .query(PrescriptionModel_.userId.equals(userId))
      ..order(PrescriptionModel_.prescriptedAt);

    return prescriptionQueryBuilder
        .watch(triggerImmediately: true)
        .map((prescriptionQuery) {
      final prescriptionModels = prescriptionQuery.find();

      return Future.wait(
        prescriptionModels.map(
          (e) async {
            final medicationInformationQuery = medicationInformationBox
                .query(
                  MedicationInformationModel_.prescriptionId.oneOf(
                    prescriptionModels.map((e) => e.id).toList(),
                  ),
                )
                .build();

            final medicationInformationModels =
                medicationInformationQuery.find();

            medicationInformationQuery.close();

            final subMedicationInformationModels = medicationInformationModels
                .where((element) => element.prescriptionId == e.id)
                .toList();

            final medicationSchedulesQuery = medicationScheduleBox
                .query(MedicationScheduleModel_.prescriptionId.equals(e.id))
                .build();

            final medicationSchedules = medicationSchedulesQuery.find();

            medicationSchedulesQuery.close();

            final pills = await KiwiContainer()
                .resolve<PillLocalDataSource>()
                .getPillsInIds(
                  medicationInformationModels.map((e) => e.pillId).toList(),
                );

            return Prescription.fromJson(
              e.toJson()
                ..['medicationInformations'] =
                    subMedicationInformationModels.map(
                  (medicationInformationModel) {
                    final pill = pills
                        .where(
                          (element) =>
                              element.id == medicationInformationModel.pillId,
                        )
                        .first;

                    final subMedicationScheduleModels = medicationSchedules
                        .where(
                          (element) =>
                              element.medicationInformationId ==
                              medicationInformationModel.id,
                        )
                        .toList();
                    return MedicationInformation.fromJson(
                      medicationInformationModel.toJson()
                        ..['pill'] = Pill.fromJson(pill.toJson())
                        ..['medicationSchedules'] = subMedicationScheduleModels
                            .map(
                              (e) => MedicationSchedule.fromJson(
                                e.toJson(),
                              ),
                            )
                            .toList(),
                    );
                  },
                ).toList(),
            );
          },
        ).toList(),
      );
    });

    // return
  }

  @override
  Future<PrescriptionModel> updatePrescription({
    required String userId,
    required PrescriptionUpdateInput updateInput,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<void> togglePrescriptionNotificaiton({
    required String userId,
    required PrescriptionNotificationUpdateInput
        prescriptionNotificationUpdateInput,
  }) async {
    final medicationInformationQuery = medicationInformationBox
        .query(
          MedicationInformationModel_.prescriptionId.equals(
            prescriptionNotificationUpdateInput.id,
          ),
        )
        .build();

    final medicationInformationModels = medicationInformationQuery.find();

    medicationInformationBox.putMany(
      medicationInformationModels
          .map(
            (e) => e.copyWith(
              afterPush: prescriptionNotificationUpdateInput.toggleValue,
              beforePush: prescriptionNotificationUpdateInput.toggleValue,
              push: prescriptionNotificationUpdateInput.toggleValue,
            ),
          )
          .toList(),
      mode: PutMode.update,
    );

    medicationInformationQuery.close();

    await medicationScheduleLocalDataSource
        .updateMedicationSchedulesPushByPrescriptionId(
      userId: userId,
      prescriptionId: prescriptionNotificationUpdateInput.id,
      push: prescriptionNotificationUpdateInput.toggleValue,
    );

    final prescriptionModel = prescriptionBox.get(
      prescriptionNotificationUpdateInput.id,
    );

    prescriptionBox.put(
      prescriptionModel!.copyWith(updatedAt: DateTime.now()),
    );
  }
}
