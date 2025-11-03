import 'package:dartz/dartz.dart';
import '../../../../core/http_client/failure.dart';
import '../entities/task_entity.dart';
import '../repositories/task_repository.dart';

class TaskUseCase {
  final TaskRepository _repository;

  TaskUseCase({required TaskRepository repository})
      : _repository = repository;
  // Define your use case logic
   Future<Either<Failure, TaskListEntity>> getTask({required String userId, required String createdBy}) {
    return _repository.getTasks(userId: userId, createdBy: createdBy);
  }
   Future<Either<Failure, TaskListEntity>> addTask({required TaskEntity request}) {
    return _repository.addTask(request: request);
  }
}