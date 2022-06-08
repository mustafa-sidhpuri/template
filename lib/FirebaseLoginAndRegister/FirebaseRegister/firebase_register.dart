import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:template/firebase/utils/models/logged_in_user.dart';

import '../utils/firebase_failures.dart';

class FirebaseRegister{
  FirebaseAuth firebaseAuth;
  FirebaseRegister({required this.firebaseAuth});

  Future<Either<FirebaseFailure,LoggedInUser>> registerUsingEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    User? user;
    try {
      // creating new user for email and password login
      UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      await user!.updateDisplayName(name);
      await user.reload();
      user = firebaseAuth.currentUser;

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
        return Left(EmailRegisterFailure(message: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
        return Left(EmailRegisterFailure(message: 'The account already exists for that email.'));
      }
    } catch (e) {
      debugPrint(e.toString());
      return Left(EmailRegisterFailure());
    }
    return Right(LoggedInUser(
        name: user!.displayName,
        email: user!.email,
        id: user!.uid,
        profilePicUrl: user!.photoURL
    ));
  }
}