// Project imports:

import 'package:collection/collection.dart';
import 'package:kiwi/kiwi.dart';
import 'package:logger/logger.dart';
import 'package:yak/core/object_box/object_box.dart';
import 'package:yak/data/datasources/local/medication_schedule/medication_schedule_local_data_source.dart';
import 'package:yak/data/models/medication_information/medication_information_model.dart';
import 'package:yak/data/models/medication_schedule/medication_schedule_model.dart';

abstract class MedicationInformationLocalDataSource {
  List<int> createMedicationInformations({
    required String userId,
    required int prescriptionId,
    required DateTime medicationStartAt,
    required int duration,
    required List<MedicationInformationModel> medicationInformationModels,
  });
}

class MedicationInformationLocalDataSourceImpl
    with ObjectBoxMixin
    implements MedicationInformationLocalDataSource {
  MedicationScheduleLocalDataSource get medicationScheduleLocalDataSource =>
      KiwiContainer().resolve<MedicationScheduleLocalDataSource>();

  @override
  List<int> createMedicationInformations({
    required String userId,
    required int prescriptionId,
    required DateTime medicationStartAt,
    required int duration,
    required List<MedicationInformationModel> medicationInformationModels,
  }) {
    final ids = medicationInformationBox.putMany(
      medicationInformationModels,
    );

    try {
      medicationInformationModels
          .mapIndexed(
            (index, medicationInformationModel) => List.generate(
              duration,
              (days) {
                final remainder =
                    days % medicationInformationModel.medicationCycle;
                final allowCreate = remainder == 0;

                return !allowCreate
                    ? <MedicationScheduleModel?>[]
                    : [
                        if (medicationInformationModel.morningHour != null)
                          medicationScheduleLocalDataSource
                              .createMedicationSchdule(
                            medicationScheduleModel: MedicationScheduleModel(
                              userId: userId,
                              prescriptionId: prescriptionId,
                              medicationInformationId: ids[index],
                              reservedAt: medicationStartAt.add(
                                Duration(
                                  days: days,
                                  hours:
                                      medicationInformationModel.morningHour!,
                                ),
                              ),
                              beforePush: medicationInformationModel.beforePush,
                              afterPush: medicationInformationModel.afterPush,
                              push: medicationInformationModel.push,
                            ),
                          ),
                        if (medicationInformationModel.afternoonHour != null)
                          medicationScheduleLocalDataSource
                              .createMedicationSchdule(
                            medicationScheduleModel: MedicationScheduleModel(
                              userId: userId,
                              prescriptionId: prescriptionId,
                              medicationInformationId: ids[index],
                              reservedAt: medicationStartAt.add(
                                Duration(
                                  days: days,
                                  hours:
                                      medicationInformationModel.afternoonHour!,
                                ),
                              ),
                              beforePush: medicationInformationModel.beforePush,
                              afterPush: medicationInformationModel.afterPush,
                              push: medicationInformationModel.push,
                            ),
                          ),
                        if (medicationInformationModel.eveningHour != null)
                          medicationScheduleLocalDataSource
                              .createMedicationSchdule(
                            medicationScheduleModel: MedicationScheduleModel(
                              userId: userId,
                              prescriptionId: prescriptionId,
                              medicationInformationId: ids[index],
                              reservedAt: medicationStartAt.add(
                                Duration(
                                  days: days,
                                  hours:
                                      medicationInformationModel.eveningHour!,
                                ),
                              ),
                              beforePush: medicationInformationModel.beforePush,
                              afterPush: medicationInformationModel.afterPush,
                              push: medicationInformationModel.push,
                            ),
                          ),
                        if (medicationInformationModel.nightHour != null)
                          medicationScheduleLocalDataSource
                              .createMedicationSchdule(
                            medicationScheduleModel: MedicationScheduleModel(
                              userId: userId,
                              prescriptionId: prescriptionId,
                              medicationInformationId: ids[index],
                              reservedAt: medicationStartAt.add(
                                Duration(
                                  days: days,
                                  hours: medicationInformationModel.nightHour!,
                                ),
                              ),
                              beforePush: medicationInformationModel.beforePush,
                              afterPush: medicationInformationModel.afterPush,
                              push: medicationInformationModel.push,
                            ),
                          ),
                      ];
              },
            ),
          )
          .expand((element) => element)
          .expand((element) => element)
          .toList();
    } catch (e) {
      Logger().e(e);
    }
    return ids;
  }
}
