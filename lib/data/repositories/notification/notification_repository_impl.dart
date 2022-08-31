// Package imports:
import 'package:dartz/dartz.dart';
import 'package:yak/core/database/database.dart';

// Project imports:
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/user/user_id.dart';
import 'package:yak/data/datasources/local/notification_schedule/notification_schedule_local_data_source.dart';
import 'package:yak/domain/repositories/notification/notification_repository.dart';

class ScheduleNotificationRepositoryImpl
    implements ScheduleNotificationRepository {
  const ScheduleNotificationRepositoryImpl({
    required this.userId,
    required this.notificationLocalDataSource,
  });

  final UserId userId;
  final NotificationScheduleLocalDataSource notificationLocalDataSource;

  @override
  Future<Either<Failure, List<NotificationScheduleModel>>>
      getValidNotification() async {
    try {
      final notificationModels = notificationLocalDataSource
          .getValidNotifications(userId: userId.value);

      return Right(notificationModels);
    } catch (e) {
      return const Left(QueryFailure());
    }
  }
}
