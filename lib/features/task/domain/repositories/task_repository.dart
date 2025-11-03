import 'package:dartz/dartz.dart';
import '../../../../core/http_client/failure.dart';
import '../entities/task_entity.dart';

abstract class TaskRepository {
  Future<Either<Failure, TaskListEntity>> getTasks({required String userId, required String createdBy});
  Future<Either<Failure, TaskListEntity>> addTask({required TaskEntity request});
  Future<Either<Failure, void>> toggleTask(int index);
  Future<Either<Failure, void>> deleteTask(int index);
}