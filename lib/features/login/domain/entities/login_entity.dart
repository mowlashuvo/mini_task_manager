import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_entity.freezed.dart';

@freezed
class UserResponseEntity with _$UserEntity {
  const factory UserResponseEntity({
    UserEntity? user,
    String? message,
    bool? success,
  }) = _UserResponseEntity;
}

@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String userId,
    required String name,
    required String username,
    required String email,
    required String role,
    String? createdAt,
    String? createdBy,
  }) = _UserEntity;
}
