// Dart imports:
import 'dart:async';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:yak/domain/entities/prescription/prescription.dart';
import 'package:yak/domain/usecases/prescription/get_prescriptions.dart';

part 'prescriptions_state.dart';

class PrescriptionsCubit extends Cubit<PrescriptionsState> {
  PrescriptionsCubit({
    required this.getPrescriptions,
  }) : super(const PrescriptionsState());

  final GetPrescriptions getPrescriptions;
  late final StreamSubscription<List<Prescription>> streamSubscription;

  Future<void> load() async {
    emit(
      state.copyWith(
        status: PrescriptionsStatus.loadInProgress,
      ),
    );
    final either = await getPrescriptions.call(null);

    return either.fold(
      (l) => emit(
        state.copyWith(
          status: PrescriptionsStatus.loadFailure,
        ),
      ),
      (r) => streamSubscription = r.listen(
        (event) => emit(
          state.copyWith(
            status: PrescriptionsStatus.loadSuccess,
            // ignore: prefer_collection_literals
            prescriptions: <Prescription>[
              ...event
                  .where(
                    (element) => !(!element.medicationStartAt
                            .add(Duration(days: element.duration))
                            .isAfter(DateTime.now()) ||
                        element.deletedAt != null),
                  )
                  .toList()
                ..sort(
                  (prev, curr) =>
                      prev.prescriptedAt.compareTo(curr.prescriptedAt),
                ),
              ...event
                  .where(
                    (element) =>
                        !element.medicationStartAt
                            .add(Duration(days: element.duration))
                            .isAfter(DateTime.now()) ||
                        element.deletedAt != null,
                  )
                  .toList()
                ..sort(
                  (prev, curr) =>
                      prev.prescriptedAt.compareTo(curr.prescriptedAt),
                ),
            ].toSet().toList(),
          ),
        ),
      ),
    );
  }

  @override
  Future<void> close() {
    streamSubscription.cancel();
    return super.close();
  }
}
