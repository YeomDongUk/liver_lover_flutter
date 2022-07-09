import 'package:drift/drift.dart';
import 'package:yak/core/class/notification.dart';
import 'package:yak/core/database/database.dart';
import 'package:yak/core/local_notification/local_notification.dart';

abstract class MedicationNotificationLocalDataSource {
  Future<void> createMedicationNotifications({
    required List<MedicationScheduleModel> medicationScheduleModels,
    required NotificationType type,
    required NotificationStatus status,
  });
}

class MedicationNotificationLocalDataSourceImpl
    extends DatabaseAccessor<AppDatabase>
    implements MedicationNotificationLocalDataSource {
  MedicationNotificationLocalDataSourceImpl(
    super.attachedDatabase,
    this.localNotification,
  );
  final LocalNotification localNotification;

  $MedicationNotificationsTable get table =>
      attachedDatabase.medicationNotifications;

  @override
  Future<void> createMedicationNotifications({
    required List<MedicationScheduleModel> medicationScheduleModels,
    required NotificationType type,
    required NotificationStatus status,
  }) async {
    final medicationNotifications = await Future.wait(
      medicationScheduleModels.map(
        (medicationScheduleModel) => into(table).insertReturning(
          MedicationNotificationsCompanion.insert(
            medicationScheduleId: medicationScheduleModel.id,
            status: status,
            type: type,
            reservedAt: medicationScheduleModel.reservedAt,
          ),
        ),
      ),
    );

    // medicationNotifications.map((e) {});

    // final notificationModels =
    //     await Future.wait(companions.map(into(table).insertReturning));

    // notificationModels.map((e) {
    // localNotification.
    // });
  }
}
