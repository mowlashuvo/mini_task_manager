part of 'task_bloc.dart';

enum TaskStatus{ initial, loading, success, error }

@freezed
class TaskState with _$TaskState {
  const factory TaskState({
    @Default([]) List<TaskEntity> tasks,
    @Default(TaskStatus.initial) TaskStatus status,
    String? error,
    String? message,
  }) = _TaskState;
}
