// Package imports:
import 'package:dartz/dartz.dart';
import 'package:yak/core/database/database.dart';

// Project imports:
import 'package:yak/core/error/failure.dart';

abstract class ScheduleNotificationRepository {
  Future<Either<Failure, List<NotificationScheduleModel>>>
      getValidNotification();
}
