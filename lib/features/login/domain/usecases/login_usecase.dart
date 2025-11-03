import 'package:dartz/dartz.dart';
import '../../../../core/http_client/failure.dart';
import '../repositories/login_repository.dart';

class LoginUseCase {
  final LoginRepository _repository;

  LoginUseCase({required LoginRepository repository})
      : _repository = repository;
  // Define your use case logic
   Future<Either<Failure, dynamic>> getLogin() {
    return _repository.getLogin();
  }
}