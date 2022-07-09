import 'package:equatable/equatable.dart';

class Prescription extends Equatable {
  const Prescription({
    required this.id,
    required this.doctorName,
    required this.prescribedAt,
    required this.push,
    required this.beforePush,
    required this.afterPush,
    // required this.medicationInformationGroup,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Prescription.fromJson(Map<String, dynamic> json) => Prescription(
        id: json['id'] as String,
        doctorName: json['doctorName'] as String,
        prescribedAt: json['prescribedAt'] as DateTime,
        push: json['push'] as bool,
        beforePush: json['beforePush'] as bool,
        afterPush: json['afterPush'] as bool,
        createdAt:
            DateTime.fromMillisecondsSinceEpoch(json['createdAt'] as int),
        updatedAt:
            DateTime.fromMillisecondsSinceEpoch(json['updatedAt'] as int),
        // medicationInformationGroup: MedicationInformationGroup.fromJson(
        //   json['medicationInformationGroup'] as Map<String, dynamic>,
        // ),
      );

  final String id;
  final String doctorName;
  final DateTime prescribedAt;
  final bool push;
  final bool beforePush;
  final bool afterPush;
  // final MedicationInformationGroup medicationInformationGroup;
  final DateTime createdAt;
  final DateTime updatedAt;

  @override
  List<Object?> get props => [
        id,
        doctorName,
        prescribedAt,
        push,
        beforePush,
        // medicationInformationGroup,
        afterPush,
        createdAt,
        updatedAt,
      ];
}
