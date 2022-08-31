// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/local_notification/local_notification.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/repositories/notification/notification_repository.dart';

class InitNotificaions extends UseCase<void, bool> {
  const InitNotificaions({
    required this.notificationRepository,
    required this.localNotification,
  });

  final ScheduleNotificationRepository notificationRepository;
  final LocalNotification localNotification;

  @override
  Future<Either<Failure, List<bool>>> call(void params) async {
    final either = await notificationRepository.getValidNotification();

    final list = await either.fold(
      (l) => Future(() => <bool>[]),
      (r) => localNotification.createNotifications(
        notificationScheduleModels: r,
      ),
    );

    return Right(list);
  }
}
