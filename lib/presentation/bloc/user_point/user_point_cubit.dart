// Dart imports:
import 'dart:async';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:yak/domain/entities/user/user_point.dart';
import 'package:yak/domain/usecases/user_point/get_user_point.dart';
import 'package:yak/presentation/bloc/on_user_cubit.dart';

part 'user_point_state.dart';

class UserPointCubit extends Cubit<UserPointState> implements IonUserCubit {
  UserPointCubit({
    required this.getUserPoint,
  }) : super(UserPointInitial());

  final GetUserPoint getUserPoint;
  StreamSubscription? _streamSubscription;
  Future<void> loadUserPoint() async {
    emit(UserPointLoadInProgress());

    final either = await getUserPoint.call(null);

    await either.fold(
      (l) async => emit(UserPointLoadFailure()),
      (r) async {
        await _streamSubscription?.cancel();
        _streamSubscription = r.listen(
          (userPoint) => emit(
            UserPointLoadSuccess(userPoint: userPoint),
          ),
        );
      },
    );
  }

  @override
  void onLogout() => emit(UserPointInitial());

  @override
  Future<void> close() async {
    await _streamSubscription?.cancel();
    _streamSubscription = null;

    return super.close();
  }
}
