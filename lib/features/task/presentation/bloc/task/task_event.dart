part of 'task_bloc.dart';

@freezed
class TaskEvent with _$TaskEvent {
  const factory TaskEvent.load() = _LoadTasks;
  const factory TaskEvent.add(TaskEntity task) = _AddTask;
  const factory TaskEvent.toggle(int index) = _ToggleTask;
  const factory TaskEvent.delete(int index) = _DeleteTask;
  const factory TaskEvent.search(String query) = _Search;
}
