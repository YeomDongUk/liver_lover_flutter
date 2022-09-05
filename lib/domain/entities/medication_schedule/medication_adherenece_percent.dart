import 'package:equatable/equatable.dart';

class MedicationAdherencePercent extends Equatable {
  const MedicationAdherencePercent({
    required this.allCount,
    required this.medicatedCount,
    required this.percent,
  });

  final int allCount;
  final int medicatedCount;
  final double percent;

  @override
  List<Object?> get props => [
        allCount,
        medicatedCount,
        percent,
      ];
}
