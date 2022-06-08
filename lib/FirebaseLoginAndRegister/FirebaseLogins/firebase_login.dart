import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:template/Local/keys.dart';
import 'package:template/firebase/utils/firebase_failures.dart';
import '../../Local/SharedPrefs.dart';

abstract class FirebaseLogins{

  Future saveUserTokenToLocalStorage(String? token)async{
    await UserPreference.setValue(key: PrefKeys.tokenKey,value:token);
  }
  String? getUserToken(){
    return UserPreference.getValue(key: PrefKeys.tokenKey);
  }


  /// sign in using otp and phone number
  /// sending otp to the phone number


  /// google login


}