import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:mini_task_manager/features/task/data/mapper/task_mapper.dart';
import '../../../../core/http_client/exception.dart';
import '../../../../core/http_client/failure.dart';
import '../../domain/entities/task_entity.dart';
import '../../domain/repositories/task_repository.dart';
import '../datasources/task_remote_datasource.dart';

class TaskRepositoryImpl implements TaskRepository {
  // Implement repository logic
  final TaskRemoteDataSource _remoteDataSource;

  const TaskRepositoryImpl({required TaskRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  @override
  Future<Either<Failure, TaskListEntity>> getTasks({required String userId, required String createdBy}) async {
    try {
      final result = await _remoteDataSource.getTasks(userId: userId, createdBy: createdBy);
      return Right(result.toEntity());
    } on ServerException catch(e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    } on AuthException {
      return const Left(AuthFailure(''));
    }
  }

  @override
  Future<Either<Failure, void>> addTask(TaskEntity task) {
    // TODO: implement addTask
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> deleteTask(int index) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> toggleTask(int index) {
    // TODO: implement toggleTask
    throw UnimplementedError();
  }
}