import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:template/firebase/FirebaseLogins/firebase_login.dart';

class FirebasePhoneAndOTPSignIn extends FirebaseLogins{

  final FirebaseAuth firebaseAuth;
  FirebasePhoneAndOTPSignIn({required this.firebaseAuth});

  ConfirmationResult? _confirmationResult;

  Future<void> signInWithPhoneNumber(String phoneNumber) async {
    await firebaseAuth
        .signInWithPhoneNumber(
      phoneNumber,
    )
        .then((confirmationResult) => _confirmationResult = confirmationResult);
  }

  /// verify OTP is correct
  Future<void> verifyCode(
      {required String code,
        required Function(UserCredential) onSuccess,
        required Function onError}) async {
    if (_confirmationResult != null) {
      await _confirmationResult!
          .confirm(code)
          .then(onSuccess)
          .onError((error, stackTrace) {
        debugPrint("verify code login repository: $error");
        debugPrint(stackTrace.toString());
        onError();
      });
    }
  }
}