class MedicationScheduleUpdateInput {
  MedicationScheduleUpdateInput({
    this.reservedAt,
    this.beforePush,
    this.afterPush,
    this.push,
    this.medicatedAt,
    DateTime? updatedAt,
  }) {
    this.updatedAt = updatedAt ?? DateTime.now();
  }

  factory MedicationScheduleUpdateInput.fromJson(Map<String, dynamic> json) =>
      MedicationScheduleUpdateInput(
        beforePush: json['beforePush'] as bool,
        afterPush: json['afterPush'] as bool,
        push: json['push'] as bool,
        medicatedAt:
            DateTime.fromMillisecondsSinceEpoch(json['medicatedAt'] as int),
        reservedAt:
            DateTime.fromMillisecondsSinceEpoch(json['reservedAt'] as int),
      );

  final bool? beforePush;
  final bool? afterPush;
  final bool? push;
  final DateTime? reservedAt;
  final DateTime? medicatedAt;
  late final DateTime? updatedAt;
}
