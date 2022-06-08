import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:template/firebase/FirebaseLogins/firebase_login.dart';
import 'package:template/firebase/utils/firebase_failures.dart';
import 'package:template/firebase/utils/models/logged_in_user.dart';

class FirebaseEmailPasswordSignIn extends FirebaseLogins{
  final FirebaseAuth firebaseAuth;
  FirebaseEmailPasswordSignIn({required this.firebaseAuth});
  /// Sign in using email and password
  Future<Either<FirebaseFailure,LoggedInUser>> loginWithEmailAndPassword(String email, String password)async{
    try{
      final result = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      // saving token in local storage
      await saveUserTokenToLocalStorage(result.credential!.token.toString());
      // returning logged in user details
      return Right(LoggedInUser(
        id: result.user!.uid,
        name: result.user!.displayName,
        email: result.user!.email,
        profilePicUrl: result.user!.photoURL,
      ));

    }on FirebaseAuthException catch(err){
      debugPrint(err.toString());
      return Left(EmailSignInFailure(message: err.code));
    }
  }
}