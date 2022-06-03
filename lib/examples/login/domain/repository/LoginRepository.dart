

import '../../../../DataHandler/Network/ApiService.dart';
import '../../data/entities/login_request_model_entity.dart';

abstract class LoginRepository{

  Future<dynamic> loginUser(LoginRequestEntity loginRequest,OnSuccess onSuccess, OnError onError);
}