import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';

import '../../../../../DataHandler/Local/PrefKeys.dart';
import '../../../../../DataHandler/Local/SharedPrefs.dart';
import '../../../../../DataHandler/Network/Utils/ErrorParsingModel.dart';
import '../../../domain/models/login_request_model.dart';
import '../../../domain/usecases/login_user.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  Login login;
  LoginBloc({required this.login}) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is LoginUser) {
        emit(LoginInProcess());
        await login.login(event.loginRequest,
                (Map<String, dynamic> json) {
                    UserPreference.setValue(key: PrefKeys.authToken,value:json["token"]);
                    emit(LoginSuccess());
                },
            (ErrorParsingModel error,err){
          emit(LoginError(error: error));
            }
            );
      }
    });
  }
}
