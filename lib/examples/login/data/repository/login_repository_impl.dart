import '../../../../DataHandler/Network/ApiService.dart';
import '../../domain/repository/LoginRepository.dart';
import '../entities/login_request_model_entity.dart';

class LoginRepositoryImpl implements LoginRepository {
  @override
  Future loginUser(LoginRequestEntity loginRequest, OnSuccess onSuccess,
      OnError onError) async {
    await ApiService.postRequest(
        url: "https://reqres.in/api/login",
        onError: onError,
        onSuccess: onSuccess,
        params: {
          "email": loginRequest.email,
          "passwo": loginRequest.password
        });
  }
}
