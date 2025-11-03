import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/task_entity.dart';
import '../../../domain/usecases/task_usecase.dart';

part 'task_event.dart';

part 'task_state.dart';

part 'task_bloc.freezed.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskUseCase _useCase;

  TaskBloc({required TaskUseCase useCase})
    : _useCase = useCase,
      super(const TaskState()) {
    on<_LoadTasks>(_onLoadTasks);
    on<_AddTask>(_onAddTask);
    on<_ToggleTask>(_onToggleTask);
    on<_DeleteTask>(_onDeleteTask);
  }

  Future<void> _onLoadTasks(_LoadTasks event, Emitter<TaskState> emit) async {
    emit(state.copyWith(status: TaskStatus.loading));
    final result = await _useCase.getTask(userId: '10', createdBy: 'shuvo');

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            status: TaskStatus.error,
            error: failure.message,
          ),
        );
      },
      (data) {

        emit(state.copyWith(tasks: data.tasks, status: TaskStatus.success, message: 'Success'));
      },
    );
  }

  Future<void> _onAddTask(_AddTask event, Emitter<TaskState> emit) async {
    emit(state.copyWith(status: TaskStatus.loading));
    final result = await _useCase.a(userId: '10', createdBy: 'shuvo');

    result.fold(
          (failure) {
        emit(
          state.copyWith(
            status: TaskStatus.error,
            error: failure.message,
          ),
        );
      },
          (data) {

        emit(state.copyWith(tasks: data.tasks, status: TaskStatus.success, message: 'Success'));
      },
    );
  }

  Future<void> _onToggleTask(_ToggleTask event, Emitter<TaskState> emit) async {
    // await _toggleTask(event.index);
    add(const TaskEvent.load());
  }

  Future<void> _onDeleteTask(_DeleteTask event, Emitter<TaskState> emit) async {
    // await _deleteTask(event.index);
    add(const TaskEvent.load());
  }
}
