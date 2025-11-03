import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_entity.freezed.dart';

@freezed
class TaskListEntity with _$TaskListEntity {
  const factory TaskListEntity({
    @Default([]) List<TaskEntity> tasks,
    String? message,
    bool? success,
  }) = _TaskListEntity;
}

@freezed
class TaskEntity with _$TaskEntity {
  const factory TaskEntity({
    required int id,
    required String title,
    required String status,
    String? createdAt,
    String? assignedTo,
  }) = _TaskEntity;
}