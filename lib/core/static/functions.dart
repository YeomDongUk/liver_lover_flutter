// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

Future<void> openDateTimePicker({
  required BuildContext context,
  required String str,
}) {
  final reservedAt = int.tryParse(str);
  final reservedDate = reservedAt == null
      ? null
      : DateTime.fromMillisecondsSinceEpoch(reservedAt);
  final now = DateTime.now();

  return DatePicker.showDateTimePicker(
    context,
    locale: LocaleType.ko,
    currentTime: reservedDate == null || reservedDate.isBefore(now)
        ? DateTime(now.year, now.month, now.day, now.hour, now.minute + 1)
        : reservedDate,
    minTime: now.add(const Duration(minutes: 1)),
  );
}

Future<DateTime?> openDatePicker({
  required BuildContext context,
  DateTime? initialValue,
  DateTime? maxTime,
  DateTime? minTime,
}) {
  final now = DateTime.now();
  return DatePicker.showDatePicker(
    context,
    currentTime: DateTime(
      (initialValue ?? now).year,
      (initialValue ?? now).month,
      (initialValue ?? now).day,
    ),
    minTime: minTime,
    maxTime: maxTime ?? DateTime.now(),
    locale: LocaleType.ko,
  );
}

String formatDuration(Duration d) {
  final hourStr = '${d.inHours.abs()}'.padLeft(2, '0');
  final minStr = '${d.inMinutes.abs().remainder(60)}'.padLeft(2, '0');
  return '$hourStr:$minStr';
}
