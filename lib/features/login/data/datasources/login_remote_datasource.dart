import '../../../../core/http_client/client.dart';
import '../../../../core/http_client/exception.dart';

abstract class LoginRemoteDataSource {
  Future<dynamic> getLogin();
}
class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
    final BaseApiClient client;

  LoginRemoteDataSourceImpl({required this.client});

  @override
  Future<dynamic> getLogin() async {
    try {
      final response = await client.get(endPoint: 'authuser.php');

      //Utils.responseLog(url, response);

        //final LoginResponse loginResponse = LoginResponse.fromRawJson(response.body);
        return '';
    
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}