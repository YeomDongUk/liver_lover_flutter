class MedicationScheduleCreateInput {
  const MedicationScheduleCreateInput({
    required this.userId,
    required this.prescriptedAt,
    required this.medicationStartAt,
    required this.medicationEndAt,
  });

  final String userId;

  final DateTime prescriptedAt;

  final DateTime medicationStartAt;

  final DateTime medicationEndAt;
}
