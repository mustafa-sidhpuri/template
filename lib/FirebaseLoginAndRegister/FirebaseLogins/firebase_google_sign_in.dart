import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:template/firebase/FirebaseLogins/firebase_login.dart';
import 'package:template/firebase/utils/models/logged_in_user.dart';

import '../utils/firebase_failures.dart';

class FirebaseGoogleSignIn extends FirebaseLogins{
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;

  FirebaseGoogleSignIn({required this.firebaseAuth, required this.googleSignIn});

  Future<Either<FirebaseFailure, LoggedInUser>> googleLogin() async{
    try{
      final googleUser = await googleSignIn.signIn();
      if (googleUser != null) {
        final googleAuth = await googleUser.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        await firebaseAuth.signInWithCredential(credential);
        await saveUserTokenToLocalStorage(googleAuth.accessToken);
        return Right(LoggedInUser(
          name: googleUser.displayName,
          id: googleUser.id,
          email: googleUser.email,
          profilePicUrl: googleUser.photoUrl
        ));
      }
      return Left(GoogleSignInFailure());
    }on FirebaseAuthException catch(err){
      debugPrint(err.toString());
      return Left(GoogleSignInFailure(message: err.code));
    }
  }
}