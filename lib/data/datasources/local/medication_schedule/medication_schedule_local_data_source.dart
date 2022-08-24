// Project imports:
import 'package:kiwi/kiwi.dart';
import 'package:collection/collection.dart';
import 'package:yak/core/database/table/point_history/point_history_table.dart';
import 'package:yak/core/local_notification/local_notification.dart';
import 'package:yak/core/object_box/object_box.dart';
import 'package:yak/core/object_box/objectbox.g.dart';
import 'package:yak/core/user/user_id.dart';
import 'package:yak/data/datasources/local/schedule_notification/schedule_notification_local_data_source.dart';
import 'package:yak/data/datasources/local/pill/pill_local_data_source.dart';
import 'package:yak/data/datasources/local/user_point/user_point_local_data_source.dart';
import 'package:yak/data/models/medication_schedule/medication_schedule_model.dart';
import 'package:yak/data/models/medication_schedule/medication_schedule_update_input.dart';
import 'package:yak/data/models/notification/schedule_notificaiton_model.dart';

import 'package:yak/domain/entities/medication_information/medication_information.dart';
import 'package:yak/domain/entities/medication_schedule/medication_schedule.dart';
import 'package:yak/domain/entities/medication_schedule/medication_schedules_group.dart';
import 'package:yak/domain/entities/pill/pill.dart';

abstract class MedicationScheduleLocalDataSource {
  Stream<Future<List<MedicationSchedulesGroup>>>
      getMedicationSchedulesGroupsStream({
    required String userId,
    required DateTime date,
  });

  MedicationScheduleModel? createMedicationSchdule({
    required MedicationScheduleModel medicationScheduleModel,
  });

  MedicationScheduleModel? updateMedicationSchedule({
    required int id,
    required MedicationScheduleUpdateInput medicationScheduleUpdateInput,
  });

  Future<List<MedicationScheduleModel>> updateMedicationSchedulesPush({
    required String userId,
    required List<int> ids,
    required bool push,
  });

  Future<void> updateMedicationSchedulesPushByPrescriptionId({
    required String userId,
    required int prescriptionId,
    required bool push,
  });

  void medicationAll({
    required String userId,
    required DateTime reservedAt,
  });

  void medicate({
    required String userId,
    required int scheduleId,
  });

  Future<MedicationSchedulesGroup> getMedicationGroup(
      {required DateTime reservedAt});
}

class MedicationScheduleLocalDataSourceImpl
    with ObjectBoxMixin
    implements MedicationScheduleLocalDataSource {
  MedicationScheduleLocalDataSourceImpl({
    required this.scheduleNotificationLocalDataSource,
  }) : super();

  final ScheduleNotificationLocalDataSource scheduleNotificationLocalDataSource;
  Query<MedicationScheduleModel>? query;

  @override
  Future<MedicationSchedulesGroup> getMedicationGroup({
    required DateTime reservedAt,
  }) async {
    final userId = KiwiContainer().resolve<UserId>().value;

    final medicationScheduleQuery = medicationScheduleBox
        .query(
          MedicationScheduleModel_.userId.equals(userId).and(
                MedicationScheduleModel_.reservedAt
                    .equals(reservedAt.millisecondsSinceEpoch),
              ),
        )
        .build();

    final medicationSchedules = medicationScheduleQuery.find();
    medicationScheduleQuery.close();

    final medicationInformationQuery = medicationInformationBox
        .query(
          MedicationInformationModel_.id.oneOf(
            medicationSchedules.map((e) => e.medicationInformationId).toList(),
          ),
        )
        .build();

    final medicationInformations = medicationInformationQuery.find();
    medicationInformationQuery.close();

    final pills =
        await KiwiContainer().resolve<PillLocalDataSource>().getPillsInIds(
              medicationInformations.map((e) => e.pillId).toList(),
            );

    return MedicationSchedulesGroup(
      reservedAt: reservedAt,
      medicationInformations: medicationInformations.map(
        (medicationInformationModel) {
          final pill = pills
              .where(
                (element) => element.id == medicationInformationModel.pillId,
              )
              .firstOrNull;

          final subMedicationSchedules = medicationSchedules
              .where(
                (medicationSchedule) =>
                    medicationSchedule.reservedAt == reservedAt,
              )
              .toList();
          return MedicationInformation.fromJson(
            medicationInformationModel.toJson()
              ..['pill'] = pill == null ? null : Pill.fromJson(pill.toJson())
              ..['medicationSchedules'] = subMedicationSchedules
                  .map(
                    (e) => MedicationSchedule.fromJson(e.toJson()),
                  )
                  .toList(),
          );
        },
      ).toList(),
      push: medicationSchedules.any((element) => element.push),
    );
  }

  @override
  Stream<Future<List<MedicationSchedulesGroup>>>
      getMedicationSchedulesGroupsStream({
    required String userId,
    required DateTime date,
  }) {
    final start = DateTime(date.year, date.month, date.day);
    final end = DateTime(date.year, date.month, date.day + 1);

    final queryBuilder = medicationScheduleBox.query(
      MedicationScheduleModel_.userId
          .equals(userId)
          .and(
            MedicationScheduleModel_.reservedAt.greaterThan(
              start.millisecondsSinceEpoch,
            ),
          )
          .and(
            MedicationScheduleModel_.reservedAt.lessOrEqual(
              end.millisecondsSinceEpoch,
            ),
          ),
    )..order(MedicationScheduleModel_.reservedAt);

    return queryBuilder.watch(triggerImmediately: true).map((query) {
      final medicationSchedules = query.find();
      final reservedAts =
          medicationSchedules.map((e) => e.reservedAt).toSet().toList();

      return Future.wait(
        reservedAts.map((reservedAt) async {
          final subMedicationSchedules = medicationSchedules
              .where((element) => element.reservedAt == reservedAt);
          final query = medicationInformationBox
              .query(
                MedicationInformationModel_.id.oneOf(
                  subMedicationSchedules
                      .map((e) => e.medicationInformationId)
                      .toList(),
                ),
              )
              .build();

          final medicationInformations = query.find();

          final pills = await KiwiContainer()
              .resolve<PillLocalDataSource>()
              .getPillsInIds(
                medicationInformations.map((e) => e.pillId).toList(),
              );

          return MedicationSchedulesGroup(
            reservedAt: reservedAt,
            medicationInformations: medicationInformations.map(
              (medicationInformationModel) {
                final pill = pills
                    .where(
                      (element) =>
                          element.id == medicationInformationModel.pillId,
                    )
                    .firstOrNull;

                final subMedicationSchedules = medicationSchedules
                    .where(
                      (medicationSchedule) =>
                          medicationSchedule.reservedAt == reservedAt,
                    )
                    .toList();
                print(subMedicationSchedules);
                return MedicationInformation.fromJson(
                  medicationInformationModel.toJson()
                    ..['pill'] =
                        pill == null ? null : Pill.fromJson(pill.toJson())
                    ..['medicationSchedules'] = subMedicationSchedules
                        .map(
                          (e) => MedicationSchedule.fromJson(e.toJson()),
                        )
                        .toList(),
                );
              },
            ).toList(),
            push: subMedicationSchedules.any((element) => element.push),
          );
        }).toList(),
      );
    });
  }

  @override
  MedicationScheduleModel? createMedicationSchdule({
    required MedicationScheduleModel medicationScheduleModel,
  }) {
    /// 복약 일정이 지금보다 이전이면 복약일정을 생성하지 않는다
    if (medicationScheduleModel.reservedAt.isBefore(DateTime.now())) {
      return null;
    }
    final id = medicationScheduleBox.put(medicationScheduleModel);
    final schedule = medicationScheduleBox.get(id)!;

    if (medicationScheduleModel.push) {
      _createScheduleNotification(medicationScheduleModel: schedule);
    }

    return schedule;
  }

  void _createScheduleNotification({
    required MedicationScheduleModel medicationScheduleModel,
  }) {
    /// 30분 전 알림을 킨 경우
    if (medicationScheduleModel.beforePush) {
      final notiReservedAt =
          medicationScheduleModel.reservedAt.add(const Duration(minutes: -30));

      final query = scheduleNotificationBox
          .query(
            ScheduleNotificationModel_.userId
                    .equals(medicationScheduleModel.userId) &
                ScheduleNotificationModel_.type.equals(1) &
                ScheduleNotificationModel_.reservedAt
                    .equals(notiReservedAt.millisecondsSinceEpoch) &
                ScheduleNotificationModel_.beforePush.equals(true),
          )
          .build();

      /// 노티 일정 조회
      final schduleNotification = query.findUnique();

      query.close();

      schduleNotification == null
          // 노티 일정이 없으면 노티 일정 생성
          ? scheduleNotificationLocalDataSource.createNotification(
              scheduleNotificationModel: ScheduleNotificationModel(
                userId: medicationScheduleModel.userId,
                type: 1,
                beforePush: true,
                scheduleIds: ['${medicationScheduleModel.id}'],
                reservedAt: notiReservedAt,
                createdAt: DateTime.now(),
                updatedAt: DateTime.now(),
              ),
            )
          // 노티 일정이 있으면 노티 일정 수정
          : scheduleNotificationLocalDataSource.updateNotification(
              scheduleNotificationModel: schduleNotification.copyWith(
                scheduleIds: schduleNotification.scheduleIds
                  ..add('${medicationScheduleModel.id}'),
              ),
            );
    }

    /// 30분 후 알림을 킨 경우
    if (medicationScheduleModel.afterPush) {
      final notiReservedAt =
          medicationScheduleModel.reservedAt.add(const Duration(minutes: 30));

      final query = scheduleNotificationBox
          .query(
            ScheduleNotificationModel_.userId
                    .equals(medicationScheduleModel.userId) &
                ScheduleNotificationModel_.type.equals(1) &
                ScheduleNotificationModel_.reservedAt
                    .equals(notiReservedAt.millisecondsSinceEpoch) &
                ScheduleNotificationModel_.beforePush.equals(false),
          )
          .build();

      final schduleNotification = query.findUnique();

      /// 쿼리 해제
      query.close();

      schduleNotification == null
          // 노티 일정이 없으면 노티 일정 생성
          ? scheduleNotificationLocalDataSource.createNotification(
              scheduleNotificationModel: ScheduleNotificationModel(
                userId: medicationScheduleModel.userId,
                type: 1,
                beforePush: false,
                scheduleIds: ['${medicationScheduleModel.id}'],
                reservedAt: notiReservedAt,
                createdAt: DateTime.now(),
                updatedAt: DateTime.now(),
              ),
            )
          // 노티 일정이 있으면 노티 일정 수정
          : scheduleNotificationLocalDataSource.updateNotification(
              scheduleNotificationModel: schduleNotification.copyWith(
                scheduleIds: schduleNotification.scheduleIds
                  ..add('${medicationScheduleModel.id}'),
              ),
            );
    }

    _initNoti(medicationScheduleModel.userId);

    return;
  }

  @override
  MedicationScheduleModel? updateMedicationSchedule({
    required int id,
    required MedicationScheduleUpdateInput medicationScheduleUpdateInput,
  }) {
    final medicationScheduleModel = medicationScheduleBox.get(id)?.coypWith(
          afterPush: medicationScheduleUpdateInput.afterPush,
          beforePush: medicationScheduleUpdateInput.beforePush,
          medicatedAt: medicationScheduleUpdateInput.medicatedAt,
          push: medicationScheduleUpdateInput.push,
          reservedAt: medicationScheduleUpdateInput.reservedAt,
        );

    if (medicationScheduleModel == null) return null;

    medicationScheduleBox.put(
      medicationScheduleModel,
      mode: PutMode.update,
    );

    return medicationScheduleModel;
  }

  @override
  Future<List<MedicationScheduleModel>> updateMedicationSchedulesPush({
    required String userId,
    required List<int> ids,
    required bool push,
  }) async {
    final medicationScheduleModels = medicationScheduleBox.getMany(ids);

    if (!push) {
      await Future.wait([
        scheduleNotificationLocalDataSource.deleteNotification(
          userId: userId,
          type: 1,
          reservedAt: medicationScheduleModels.first!.reservedAt
              .add(const Duration(minutes: -30)),
        ),
        scheduleNotificationLocalDataSource.deleteNotification(
          userId: userId,
          type: 1,
          reservedAt: medicationScheduleModels.first!.reservedAt
              .add(const Duration(minutes: 30)),
        ),
      ]);
    } else {
      await Future.wait([
        scheduleNotificationLocalDataSource.createNotification(
          scheduleNotificationModel: ScheduleNotificationModel(
            type: 1,
            scheduleIds: ids.map((e) => '$e').toList(),
            userId: userId,
            reservedAt: medicationScheduleModels.first!.reservedAt
                .add(const Duration(minutes: -30)),
            beforePush: true,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          ),
        ),
        scheduleNotificationLocalDataSource.createNotification(
          scheduleNotificationModel: ScheduleNotificationModel(
            type: 1,
            scheduleIds: ids.map((e) => '$e').toList(),
            userId: userId,
            reservedAt: medicationScheduleModels.first!.reservedAt
                .add(const Duration(minutes: 30)),
            beforePush: false,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          ),
        )
      ]);
    }

    await _initNoti(userId);

    return medicationScheduleBox
        .getMany(
          medicationScheduleBox.putMany(
            medicationScheduleModels
                .where((element) => element != null)
                .cast<MedicationScheduleModel>()
                .map(
                  (e) => e.coypWith(
                    push: push,
                    afterPush: push,
                    beforePush: push,
                  ),
                )
                .toList(),
            mode: PutMode.update,
          ),
        )
        .cast<MedicationScheduleModel>()
        .toList();
  }

  @override
  void medicationAll({
    required String userId,
    required DateTime reservedAt,
  }) {
    final medicationScheduleQuery = medicationScheduleBox
        .query(
          MedicationScheduleModel_.userId.equals(userId) &
              MedicationScheduleModel_.medicatedAt.isNull() &
              MedicationScheduleModel_.reservedAt.equals(
                reservedAt.millisecondsSinceEpoch,
              ),
        )
        .build();

    final medicationSchedules = medicationScheduleQuery.find();

    medicationScheduleQuery.close();

    if (medicationSchedules.isEmpty) return;

    final medicationInformationModels = medicationInformationBox.getMany(
      medicationSchedules.map((e) => e.medicationInformationId).toList(),
    );

    final point = medicationInformationModels
        .map(
          (e) => e!.medicationCycle,
        )
        .toList()
        .fold<int>(
          0,
          (previousValue, element) => previousValue + element,
        );

    KiwiContainer().resolve<UserPointLocalDataSource>().addUserPoint(
          event: PointHistoryEvent.medicationComplete,
          eventId: '${medicationSchedules.first.id}',
          userId: userId,
          point: point,
        );

    medicationScheduleBox.putMany(
      medicationSchedules
          .map(
            (e) => e.coypWith(
              push: false,
              afterPush: false,
              beforePush: false,
              medicatedAt: DateTime.now(),
            ),
          )
          .toList(),
      mode: PutMode.update,
    );

    scheduleNotificationLocalDataSource
        .deleteNotification(
          userId: userId,
          type: 1,
          reservedAt: reservedAt,
        )
        .then((value) => _initNoti(userId));
  }

  @override
  Future<void> updateMedicationSchedulesPushByPrescriptionId({
    required String userId,
    required int prescriptionId,
    required bool push,
  }) async {
    final medicationScheduleQuery = medicationScheduleBox
        .query(
          MedicationScheduleModel_.prescriptionId.equals(
                prescriptionId,
              ) &
              MedicationScheduleModel_.reservedAt.greaterThan(
                DateTime.now().millisecondsSinceEpoch,
              ),
        )
        .build();

    final medicationScheduleModels = medicationScheduleQuery.find();
    medicationScheduleQuery.close();

    medicationScheduleBox.putMany(
      medicationScheduleModels
          .map(
            (e) => e.coypWith(
              afterPush: push,
              beforePush: push,
              push: push,
            ),
          )
          .toList(),
    );

    final reservedAtMap = <DateTime, List<MedicationScheduleModel>>{};

    for (final medicationScheduleModel in medicationScheduleModels) {
      if (reservedAtMap.containsKey(medicationScheduleModel.reservedAt)) {
        reservedAtMap[medicationScheduleModel.reservedAt]!
            .add(medicationScheduleModel);
      } else {
        reservedAtMap[medicationScheduleModel.reservedAt] = [
          medicationScheduleModel
        ];
      }
      // e.reservedAt;
    }

    if (push) {
      await Future.wait(
        reservedAtMap.entries.map((mapEntry) async {
          final beforeReservedAt =
              mapEntry.key.add(const Duration(minutes: -30));
          final scheduleIds = mapEntry.value.map((e) => '${e.id}').toList();
          final beforeQuery = scheduleNotificationBox
              .query(
                ScheduleNotificationModel_.userId.equals(userId) &
                    ScheduleNotificationModel_.type.equals(1) &
                    ScheduleNotificationModel_.beforePush.equals(true) &
                    ScheduleNotificationModel_.reservedAt.equals(
                      beforeReservedAt.millisecondsSinceEpoch,
                    ),
              )
              .build();

          final beforeScheduleNotificaitonModel = beforeQuery.findFirst();
          beforeQuery.close();

          if (beforeScheduleNotificaitonModel == null) {
            await scheduleNotificationLocalDataSource.createNotification(
              scheduleNotificationModel: ScheduleNotificationModel(
                userId: userId,
                type: 1,
                scheduleIds: mapEntry.value.map((e) => '${e.id}').toList(),
                beforePush: true,
                reservedAt: beforeReservedAt,
              ),
            );
          } else {
            scheduleNotificationLocalDataSource.updateNotification(
              scheduleNotificationModel:
                  beforeScheduleNotificaitonModel.copyWith(
                scheduleIds: (beforeScheduleNotificaitonModel.scheduleIds
                      ..addAll(scheduleIds))
                    .toSet()
                    .toList(),
              ),
            );
          }

          final afterReservedAt = mapEntry.key.add(const Duration(minutes: 30));

          final afterQuery = scheduleNotificationBox
              .query(
                ScheduleNotificationModel_.userId.equals(userId) &
                    ScheduleNotificationModel_.type.equals(1) &
                    ScheduleNotificationModel_.reservedAt.equals(
                      afterReservedAt.millisecondsSinceEpoch,
                    ),
              )
              .build();

          final afterScheduleNotificaitonModel = afterQuery.findFirst();
          afterQuery.close();

          if (afterScheduleNotificaitonModel == null) {
            await scheduleNotificationLocalDataSource.createNotification(
              scheduleNotificationModel: ScheduleNotificationModel(
                userId: userId,
                type: 1,
                scheduleIds: mapEntry.value.map((e) => '${e.id}').toList(),
                beforePush: false,
                reservedAt: beforeReservedAt,
              ),
            );
          } else {
            scheduleNotificationLocalDataSource.updateNotification(
              scheduleNotificationModel:
                  afterScheduleNotificaitonModel.copyWith(
                scheduleIds: (afterScheduleNotificaitonModel.scheduleIds
                      ..addAll(scheduleIds))
                    .toSet()
                    .toList(),
              ),
            );
          }
        }).toList(),
      );
    } else {
      await Future.wait(
        reservedAtMap.entries.map((mapEntry) async {
          final beforeReservedAt =
              mapEntry.key.add(const Duration(minutes: -30));

          final scheduleIds = mapEntry.value.map((e) => '${e.id}').toList();

          final beforeQuery = scheduleNotificationBox
              .query(
                ScheduleNotificationModel_.userId.equals(userId) &
                    ScheduleNotificationModel_.type.equals(1) &
                    ScheduleNotificationModel_.beforePush.equals(false) &
                    ScheduleNotificationModel_.reservedAt.equals(
                      beforeReservedAt.millisecondsSinceEpoch,
                    ),
              )
              .build();

          final beforeScheduleNotificaitonModel = beforeQuery.findFirst();
          beforeQuery.close();

          if (beforeScheduleNotificaitonModel != null) {
            final newScheduleIds =
                List<String>.from(beforeScheduleNotificaitonModel.scheduleIds)
                  ..removeWhere(scheduleIds.contains);

            if (newScheduleIds.isEmpty) {
              await scheduleNotificationLocalDataSource.deleteNotification(
                userId: userId,
                type: 1,
                reservedAt: beforeReservedAt,
              );
            } else {
              scheduleNotificationLocalDataSource.updateNotification(
                scheduleNotificationModel: beforeScheduleNotificaitonModel
                    .copyWith(scheduleIds: newScheduleIds),
              );
            }
          }

          final afterReservedAt = mapEntry.key.add(const Duration(minutes: 30));
          final afterQuery = scheduleNotificationBox
              .query(
                ScheduleNotificationModel_.userId.equals(userId) &
                    ScheduleNotificationModel_.type.equals(1) &
                    ScheduleNotificationModel_.beforePush.equals(false) &
                    ScheduleNotificationModel_.reservedAt.equals(
                      afterReservedAt.millisecondsSinceEpoch,
                    ),
              )
              .build();

          final afterScheduleNotificaitonModel = afterQuery.findFirst();
          afterQuery.close();

          if (afterScheduleNotificaitonModel != null) {
            final newScheduleIds =
                List<String>.from(afterScheduleNotificaitonModel.scheduleIds)
                  ..removeWhere(scheduleIds.contains);
            if (newScheduleIds.isEmpty) {
              await scheduleNotificationLocalDataSource.deleteNotification(
                userId: userId,
                type: 1,
                reservedAt: afterReservedAt,
              );
            } else {
              scheduleNotificationLocalDataSource.updateNotification(
                scheduleNotificationModel: afterScheduleNotificaitonModel
                    .copyWith(scheduleIds: newScheduleIds),
              );
            }
          }
        }).toList(),
      );
    }

    await _initNoti(userId);
  }

  Future<void> _initNoti(String userId) =>
      KiwiContainer().resolve<LocalNotification>().createNotifications(
            scheduleNotificationModels:
                scheduleNotificationLocalDataSource.getValidNotifications(
              userId: userId,
            ),
          );

  @override
  void medicate({
    required String userId,
    required int scheduleId,
  }) {
    final medicationScheduleModel = medicationScheduleBox.get(scheduleId);

    if (medicationScheduleModel == null) return;

    medicationScheduleBox.put(
      medicationScheduleModel.coypWith(
        push: false,
        afterPush: false,
        beforePush: false,
        medicatedAt: DateTime.now(),
      ),
      mode: PutMode.update,
    );

    final medicationInformationModel = medicationInformationBox.get(
      medicationScheduleModel.medicationInformationId,
    );

    KiwiContainer().resolve<UserPointLocalDataSource>().addUserPoint(
          event: PointHistoryEvent.medicationComplete,
          eventId: '$scheduleId',
          userId: userId,
          point: medicationInformationModel!.medicationCycle,
        );
  }
}
