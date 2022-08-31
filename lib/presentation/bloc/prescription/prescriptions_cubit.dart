// Dart imports:
import 'dart:async';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:yak/data/models/prescription/prescription_notification_update_input.dart';
import 'package:yak/domain/entities/prescription/prescription.dart';
import 'package:yak/domain/usecases/prescription/get_prescriptions.dart';
import 'package:yak/domain/usecases/prescription/toggle_prescription_notification.dart';

part 'prescriptions_state.dart';

class PrescriptionsCubit extends Cubit<PrescriptionsState> {
  PrescriptionsCubit({
    required this.getPrescriptions,
    required this.togglePrescriptionNotification,
  }) : super(const PrescriptionsState());

  final GetPrescriptions getPrescriptions;
  final TogglePrescriptionNotification togglePrescriptionNotification;
  late final StreamSubscription<Future<List<Prescription>>> streamSubscription;

  Future<void> toggle({
    required int id,
  }) async {
    final prescription =
        state.prescriptions.firstWhere((element) => element.id == id);
    await togglePrescriptionNotification.call(
      PrescriptionNotificationUpdateInput(
        id: id,
        toggleValue: !prescription.medicationInformations!.any(
          (medicationInformation) => medicationInformation.medicationSchedules
              .where((element) => element.reservedAt.isAfter(DateTime.now()))
              .any(
                (medicationSchedule) => medicationSchedule.push,
              ),
        ),
      ),
    );
  }

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
      (r) => streamSubscription = r.listen((event) async {
        final prescriptions = await event;
        emit(
          state.copyWith(
            status: PrescriptionsStatus.loadSuccess,
            prescriptions: prescriptions,
          ),
        );
      }),
    );
  }

  @override
  Future<void> close() {
    streamSubscription.cancel();
    return super.close();
  }
}
