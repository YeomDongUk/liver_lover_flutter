import 'package:equatable/equatable.dart';
// import 'package:yak/core/database/table/medication_alarm/medication_notification_table.dart';

// class MedicationAlarm extends Equatable {
//   const MedicationAlarm({
//     required this.id,
//     required this.medicationScheduleId,
//     required this.status,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   factory MedicationAlarm.fromJson(Map<String, dynamic> json) =>
//       MedicationAlarm(
//         id: json['id'] as int,
//         medicationScheduleId: json['medicationScheduleId'] as String,
//         status: MedicationAlarmStatus.values[(json['status'] as int)],
//         createdAt:
//             DateTime.fromMillisecondsSinceEpoch(json['createdAt'] as int),
//         updatedAt:
//             DateTime.fromMillisecondsSinceEpoch(json['updatedAt'] as int),
//       );

//   final int id;
//   final String medicationScheduleId;
//   final MedicationAlarmStatus status;
//   final DateTime createdAt;
//   final DateTime updatedAt;

//   @override
//   List<Object?> get props => throw UnimplementedError();
// }
