part of 'user_point_cubit.dart';

abstract class UserPointState extends Equatable {
  const UserPointState({
    this.userPoint,
  });

  final UserPoint? userPoint;

  UserPointState copyWith();
  @override
  List<Object?> get props => [userPoint];
}

class UserPointInitial extends UserPointState {
  @override
  UserPointState copyWith() => this;
}

class UserPointLoadInProgress extends UserPointState {
  @override
  UserPointState copyWith() => this;
}

class UserPointLoadSuccess extends UserPointState {
  const UserPointLoadSuccess({required super.userPoint});

  @override
  UserPoint get userPoint => super.userPoint!;

  @override
  UserPointState copyWith({UserPoint? userPoint}) =>
      UserPointLoadSuccess(userPoint: userPoint);
}

class UserPointLoadFailure extends UserPointState {
  @override
  UserPointState copyWith() => this;
}
