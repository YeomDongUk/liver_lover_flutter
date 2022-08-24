// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/error/failure.dart';
import 'package:yak/data/models/notification/schedule_notificaiton_model.dart';

abstract class ScheduleNotificationRepository {
  Future<Either<Failure, List<ScheduleNotificationModel>>>
      getValidNotification();
}
