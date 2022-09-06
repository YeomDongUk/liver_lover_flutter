// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/user/user_id.dart';
import 'package:yak/data/datasources/local/medication_schedule/medication_schedule_local_data_source.dart';
import 'package:yak/data/models/medication_schedule/medication_schedule_create_input.dart';
import 'package:yak/domain/entities/medication_information/medication_information.dart';
import 'package:yak/domain/entities/medication_schedule/medication_adherenece_percent.dart';
import 'package:yak/domain/entities/medication_schedule/medication_schedule.dart';
import 'package:yak/domain/entities/medication_schedule/medication_schedules_daily_group.dart';
import 'package:yak/domain/entities/medication_schedule/medication_schedule_group.dart';
import 'package:yak/domain/entities/pill/pill.dart';
import 'package:yak/domain/repositories/medication_schedule/medication_schedule_repository.dart';

class MedicationScheduleRepositoryImpl implements MedicationScheduleRepository {
  MedicationScheduleRepositoryImpl(
    this.medicationScheduleLocalDataSource,
    this.userId,
  );

  final MedicationScheduleLocalDataSource medicationScheduleLocalDataSource;
  final UserId userId;

  @override
  Future<Either<Failure, MedicationSchedule>> createMedicationSchedule(
    MedicationScheduleCreateInput companion,
  ) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> deleteMedicationSchedule(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<MedicationSchedule>>>
      getMedicationSchedulesByPrescriptionId({
    required String prescriptionId,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updateMedicationSchedulesPush({
    required DateTime reservedAt,
    required bool push,
  }) async {
    await medicationScheduleLocalDataSource.updateMedicationSchedulesPush(
      push: push,
      userId: userId.value,
      reservedAt: reservedAt,
    );

    return const Right(null);
  }

  @override
  Either<Failure, void> medicateAll({
    required DateTime reservedAt,
  }) =>
      Right(
        medicationScheduleLocalDataSource.medicationAll(
          userId: userId.value,
          reservedAt: reservedAt,
        ),
      );

  @override
  Either<Failure, void> medicate({required String scheduleId}) => Right(
        medicationScheduleLocalDataSource.medicate(
          userId: userId.value,
          scheduleId: scheduleId,
        ),
      );

  @override
  Either<Failure, Stream<MedicationAdherencePercent>>
      getMedicationAdherenecePercent() => Right(
            medicationScheduleLocalDataSource.getMedicationAdherenecePercent(
              userId: userId.value,
            ),
          );

  @override
  Either<Failure,
      Stream<List<MedicationScheduleGroup>>> getMedicationScheduleGroups({
    required DateTime dateTime,
  }) =>
      Right(
        medicationScheduleLocalDataSource
            .getDailyMedicationScheduleGroups(
              userId: userId.value,
              dateTime: dateTime,
            )
            .map(
              (medicationScheduleGroupModels) => medicationScheduleGroupModels
                  .map(
                    (medicationScheduleGroup) => MedicationScheduleGroup(
                      reservedAt: medicationScheduleGroup.reservedAt,
                      medicationInformations: medicationScheduleGroup
                          .medicationInformationModels
                          .map(
                            (medicationInformationModel) =>
                                MedicationInformation.fromJson(
                              medicationInformationModel.toJson()
                                ..['pill'] = Pill.fromJson(
                                  medicationScheduleGroup.pillModels
                                      .firstWhere(
                                        (pillModel) =>
                                            medicationInformationModel.pillId ==
                                            pillModel.id,
                                      )
                                      .toJson(),
                                ),
                            ),
                          )
                          .toList(),
                      medicationSchedules:
                          medicationScheduleGroup.medicationScheduleModels
                              .map(
                                (medicationScheduleModel) =>
                                    MedicationSchedule.fromJson(
                                  medicationScheduleModel.toJson(),
                                ),
                              )
                              .toList(),
                    ),
                  )
                  .toList(),
            ),
      );

  @override
  Either<Failure, Stream<MedicationScheduleGroup>> getMedicationScheduleGroup({
    required DateTime dateTime,
  }) {
    return Right(
      medicationScheduleLocalDataSource
          .getMedicationScheduleGroup(
            userId: userId.value,
            reservedAt: dateTime,
          )
          .map(
            (medicationScheduleGroupModel) => MedicationScheduleGroup(
              reservedAt: medicationScheduleGroupModel.reservedAt,
              medicationInformations:
                  medicationScheduleGroupModel.medicationInformationModels
                      .map(
                        (medicationInformationModel) =>
                            MedicationInformation.fromJson(
                          medicationInformationModel.toJson()
                            ..['pill'] = Pill.fromJson(
                              medicationScheduleGroupModel.pillModels
                                  .firstWhere(
                                    (pillModel) =>
                                        medicationInformationModel.pillId ==
                                        pillModel.id,
                                  )
                                  .toJson(),
                            ),
                        ),
                      )
                      .toList(),
              medicationSchedules: medicationScheduleGroupModel
                  .medicationScheduleModels
                  .map(
                    (medicationScheduleModel) => MedicationSchedule.fromJson(
                      medicationScheduleModel.toJson(),
                    ),
                  )
                  .toList(),
            ),
          ),
    );
  }

  @override
  Either<Failure, Stream<List<MedicationScheduleDailyGroup>>>
      getMedicationScheduleDailyGroups({
    required DateTime dateTime,
  }) =>
          Right(
            medicationScheduleLocalDataSource
                .getMedicationScheduleGroups(
              userId: userId.value,
              start: dateTime,
              end: DateTime(dateTime.year, dateTime.month + 1, dateTime.day),
            )
                .map(
              (medicationScheduleGroupModels) {
                final medicationScheduleGroups = medicationScheduleGroupModels
                    .map(
                      (medicationScheduleGroup) => MedicationScheduleGroup(
                        reservedAt: medicationScheduleGroup.reservedAt,
                        medicationInformations:
                            medicationScheduleGroup.medicationInformationModels
                                .map(
                                  (medicationInformationModel) =>
                                      MedicationInformation.fromJson(
                                    medicationInformationModel.toJson()
                                      ..['pill'] = Pill.fromJson(
                                        medicationScheduleGroup.pillModels
                                            .firstWhere(
                                              (pillModel) =>
                                                  medicationInformationModel
                                                      .pillId ==
                                                  pillModel.id,
                                            )
                                            .toJson(),
                                      ),
                                  ),
                                )
                                .toList(),
                        medicationSchedules:
                            medicationScheduleGroup.medicationScheduleModels
                                .map(
                                  (medicationScheduleModel) =>
                                      MedicationSchedule.fromJson(
                                    medicationScheduleModel.toJson(),
                                  ),
                                )
                                .toList(),
                      ),
                    )
                    .toList();
                final map = <DateTime, List<MedicationScheduleGroup>>{};

                for (final medicationScheduleGroup
                    in medicationScheduleGroups) {
                  final reservedDate = DateTime(
                    medicationScheduleGroup.reservedAt.year,
                    medicationScheduleGroup.reservedAt.month,
                    medicationScheduleGroup.reservedAt.day,
                  );

                  final dt = reservedDate.add(
                    Duration(
                      days: reservedDate == medicationScheduleGroup.reservedAt
                          ? -1
                          : 0,
                    ),
                  );

                  if (map.containsKey(dt)) {
                    map[dt]?.add(medicationScheduleGroup);
                  } else {
                    map[dt] = [medicationScheduleGroup];
                  }
                }

                return map.keys
                    .map(
                      (e) => MedicationScheduleDailyGroup(
                        dateTime: e,
                        medicationScheduleGroups: map[e] ?? [],
                      ),
                    )
                    .toList();
              },
            ),
          );
}
