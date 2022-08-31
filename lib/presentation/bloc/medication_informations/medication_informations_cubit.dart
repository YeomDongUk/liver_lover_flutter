import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yak/domain/entities/medication_information/medication_information.dart';
import 'package:yak/domain/usecases/medication_information/get_medication_informations.dart';
import 'package:yak/presentation/bloc/on_user_cubit.dart';

part 'medication_informations_state.dart';

class MedicationInformationsCubit extends Cubit<MedicationInformationsState>
    implements IonUserCubit {
  MedicationInformationsCubit({
    required this.getMedicationInformations,
  }) : super(const MedicationInformationsState());

  final GetMedicationInformations getMedicationInformations;
  StreamSubscription<List<MedicationInformation>>?
      medicationInformationSubscription;

  Future<void> loadInforations() async {
    final either = await getMedicationInformations.call(null);

    either.fold(
      (l) => null,
      (r) {
        medicationInformationSubscription?.cancel();
        medicationInformationSubscription = r.listen((event) {});
      },
    );
  }

  @override
  void onLogout() {
    medicationInformationSubscription?.cancel();
    emit(const MedicationInformationsState());
  }
}
