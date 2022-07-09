import 'package:intl/intl.dart';

class DdayParser {
  const DdayParser._();
  static final _dateFormat = DateFormat('yyyy.MM.dd');
  static String parseDday(DateTime reservedAt, {bool parseTime = false}) {
    final now = DateTime.now();
    final nowDate = _dateFormat.parse(_dateFormat.format(now));
    final reserveDate = _dateFormat.parse(_dateFormat.format(reservedAt));
    final dayDifference = reserveDate.difference(nowDate).inDays;

    if (dayDifference == 0 && parseTime) {
      final difference = reservedAt.difference(now);
      final inHours = difference.inHours.remainder(24);
      final inMinutes = difference.inMinutes.remainder(60);
      return '${'$inHours'.padLeft(2, '0')}:${'$inMinutes'.padLeft(2, '0')}';
    } else {
      return 'D${dayDifference < 0 ? '+' : '-'}${dayDifference.abs()}';
    }
  }
}
