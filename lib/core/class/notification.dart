enum NotificationStatus {
  /// 노티피케이션 온
  on,

  /// 노티피케이션 오프
  off,
}

enum NotificationType {
  /// 복약
  medication(
    channelKey: 'medication',
    title: '복약시간',
  ),

  /// 병원 방문
  hospitalVisit(
    channelKey: 'hospital_visit',
    title: '병원 방문',
  );

  const NotificationType({
    required this.channelKey,
    required this.title,
  });
  final String channelKey;
  final String title;
}

enum NotificationSubType {
  /// 30분 전 알림
  beforeHalfHour,

  /// 2시간 전 알림
  beforeTwoHours,

  /// 하루 전 알림
  beforeDay,

  /// 30분 후 알림
  afterHalfHour,
}
