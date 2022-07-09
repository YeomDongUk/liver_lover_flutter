import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentTimeCubit extends Cubit<DateTime> {
  CurrentTimeCubit() : super(DateTime.now()) {
    timer = Timer.periodic(
      const Duration(milliseconds: 100),
      (timer) {
        final now = DateTime.now();

        final dateTime = DateTime(
          now.year,
          now.month,
          now.day,
          now.hour,
          now.minute,
          now.second,
        );

        final isSameTime = dateTime ==
            DateTime(
              state.year,
              state.month,
              state.day,
              state.hour,
              state.minute,
              state.second,
            );

        if (!isSameTime) {
          emit(dateTime);
        }
      },
    );
  }

  late Timer timer;
  @override
  Future<void> close() {
    timer.cancel();
    return super.close();
  }
}
