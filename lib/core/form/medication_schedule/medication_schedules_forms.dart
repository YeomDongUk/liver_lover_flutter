// Package imports:
import 'package:formz/formz.dart';

// Project imports:
import 'package:yak/data/models/medication_information/medication_information_create_form.dart';

enum MedicatedAtValidationError {
  empty,
  wrong,
  notValidated,
}

class MedicationInformationCreateFormInput
    extends FormzInput<List<MedicationInformationCreateForm>, bool> {
  const MedicationInformationCreateFormInput.pure() : super.pure(const []);
  const MedicationInformationCreateFormInput.dirty(super.value) : super.dirty();

  @override
  bool? validator(List<MedicationInformationCreateForm> value) {
    final pillIds = value.map((e) => e.pill.id).toList();
    final map = <String, int>{};

    for (final pillId in pillIds) {
      if (map.containsKey(pillId)) return false;
      map[pillId] = 1;
    }

    return value.every((element) => element.canSubmit) ? null : false;
  }
}
