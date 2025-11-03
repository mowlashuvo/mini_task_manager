import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../../../core/http_client/exception.dart';
import '../../../../core/http_client/failure.dart';
import '../../domain/repositories/login_repository.dart';
import '../datasources/login_remote_datasource.dart';
import '../models/login_model.dart';

class LoginRepositoryImpl implements LoginRepository {
  // Implement repository logic
  final LoginRemoteDataSource _remoteDataSource;

  const LoginRepositoryImpl({required LoginRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  @override
  Future<Either<Failure, dynamic>> getLogin() async {
    try {
      final result = await _remoteDataSource.getLogin();
      return Right(result);
    } on ServerException catch(e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    } on AuthException {
      return const Left(AuthFailure(''));
    }
  }
}