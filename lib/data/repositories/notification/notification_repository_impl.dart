// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/user/user_id.dart';
import 'package:yak/data/datasources/local/schedule_notification/schedule_notification_local_data_source.dart';
import 'package:yak/data/models/notification/schedule_notificaiton_model.dart';
import 'package:yak/domain/repositories/notification/notification_repository.dart';

class ScheduleNotificationRepositoryImpl
    implements ScheduleNotificationRepository {
  const ScheduleNotificationRepositoryImpl({
    required this.userId,
    required this.notificationLocalDataSource,
  });

  final UserId userId;
  final ScheduleNotificationLocalDataSource notificationLocalDataSource;

  @override
  Future<Either<Failure, List<ScheduleNotificationModel>>>
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
