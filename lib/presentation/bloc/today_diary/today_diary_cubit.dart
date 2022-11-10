// Dart imports:
import 'dart:async';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:yak/domain/entities/drinking_history/drinking_history.dart';
import 'package:yak/domain/entities/smoking_history/smoking_history.dart';
import 'package:yak/domain/usecases/drinking_history/get_last_drinking_history_stream.dart';
import 'package:yak/domain/usecases/smoking_history/get_last_smoking_history_stream.dart';

part 'today_diary_state.dart';

class TodayDiaryCubit extends Cubit<TodayDiaryState> {
  TodayDiaryCubit({
    required this.getLastDrinkingHistoryStream,
    required this.getLastSmokingHistoryStream,
  }) : super(const TodayDiaryState());

  final GetLastDrinkingHistoryStream getLastDrinkingHistoryStream;
  final GetLastSmokingHistoryStream getLastSmokingHistoryStream;

  StreamSubscription<DrinkingHistory?>? _lastDrinkingHistoryStreamSubscription;
  StreamSubscription<SmokingHistory?>? _lastSmokingHistoryStreamSubscription;

  Future<void> startListening() async {
    final lastDrinkingHistoryStream = await _lastDrinkingHistoryStream;

    await _lastDrinkingHistoryStreamSubscription?.cancel();

    _lastDrinkingHistoryStreamSubscription = lastDrinkingHistoryStream.listen(
      (event) => emit(
        TodayDiaryState(
          drinkingHistory: event,
          smokingHistory: state.smokingHistory,
        ),
      ),
    );

    final lastSmokingHistoryStream = await _lastSmokingHistoryStream;

    await _lastSmokingHistoryStreamSubscription?.cancel();

    _lastSmokingHistoryStreamSubscription = lastSmokingHistoryStream.listen(
      (event) => emit(
        TodayDiaryState(
          drinkingHistory: state.drinkingHistory,
          smokingHistory: event,
        ),
      ),
    );
  }

  Future<Stream<DrinkingHistory?>> get _lastDrinkingHistoryStream async {
    final either = await getLastDrinkingHistoryStream(null);
    return either.foldRight(
      Stream<DrinkingHistory?>.fromIterable([]),
      (r, previous) => r,
    );
  }

  Future<Stream<SmokingHistory?>> get _lastSmokingHistoryStream async {
    final either = await getLastSmokingHistoryStream(null);
    return either.foldRight(
      Stream<SmokingHistory?>.fromIterable([]),
      (r, previous) => r,
    );
  }

  @override
  Future<void> close() async {
    await Future.wait([
      if (_lastDrinkingHistoryStreamSubscription != null) _lastDrinkingHistoryStreamSubscription!.cancel(),
      if (_lastSmokingHistoryStreamSubscription != null) _lastSmokingHistoryStreamSubscription!.cancel(),
    ]);

    return super.close();
  }
}
