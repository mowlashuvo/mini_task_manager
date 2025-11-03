part of 'login_bloc.dart';

enum AuthStatus { initial, loading, success, failure }

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(AuthStatus.initial) AuthStatus status,
    UserEntity? user,
    String? message,
  }) = _AuthState;
}
