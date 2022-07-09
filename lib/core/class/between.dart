abstract class Between<Type> {
  const Between({
    required this.start,
    required this.end,
  });

  final Type start;
  final Type end;
}

class BetweenDateTime extends Between<DateTime> {
  BetweenDateTime({
    required super.start,
    required super.end,
  }) : assert(
          start.millisecondsSinceEpoch <= end.millisecondsSinceEpoch,
          '시작시간은 종료시간보다 길면 안됨',
        );
}
