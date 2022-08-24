// Package imports:
import 'package:equatable/equatable.dart';

class Optional<T> extends Equatable {
  const Optional()
      : isValid = false,
        value = null;

  const Optional.value(this.value) : isValid = true;

  final bool isValid;
  final T? value;

  @override
  List<Object?> get props => [
        isValid,
        value,
      ];
}
