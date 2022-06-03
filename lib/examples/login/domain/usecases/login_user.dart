

import '../../../../DataHandler/Network/ApiService.dart';
import '../models/login_request_model.dart';
import '../repository/LoginRepository.dart';

class Login{
  LoginRepository repository;
  Login({required this.repository});

  Future login(LoginRequestModel loginRequest, OnSuccess onSuccess, OnError onError)async{
    await repository.loginUser(loginRequest.transform(), onSuccess, onError);
  }
}