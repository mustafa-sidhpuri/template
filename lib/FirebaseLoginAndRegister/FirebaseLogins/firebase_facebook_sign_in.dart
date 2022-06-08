import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:template/Local/keys.dart';
import 'package:template/firebase/FirebaseLogins/firebase_login.dart';
import 'package:template/firebase/utils/firebase_failures.dart';
import 'package:template/firebase/utils/models/logged_in_user.dart';

import '../../Local/SharedPrefs.dart';

class FirebaseFacebookSignIn extends FirebaseLogins{
  final FacebookAuth facebookAuth;
  final FirebaseAuth firebaseAuth;
  FirebaseFacebookSignIn({required this.facebookAuth, required this.firebaseAuth,});

  Future<Either<FirebaseFailure,LoggedInUser>> facebookLogin()async{
    try{
      // login with facebook
      final facebookLoginResult = await facebookAuth.login();
      // after successful login we get user details
      final userData = await facebookAuth.getUserData();

      // if data is not empty
      if(userData.isNotEmpty){
        // get credentials from facebook
        final facebookAuthCredentials = FacebookAuthProvider.credential(
            facebookLoginResult.accessToken!.token);
        // and sign in with credential in FirebaseLoginAndRegister
        await firebaseAuth.signInWithCredential(facebookAuthCredentials);
        // saving token in local storage
        await saveUserTokenToLocalStorage(facebookLoginResult.accessToken!.token);
        // after successful sign in return LoggedInUser object with data

        return Right(LoggedInUser(
            name: userData["name"],
            profilePicUrl: userData["picture"]["data"]["url"],
            id: userData["id"],
            email: userData["email"]));
      } else{
        return Left(FacebookSignInFailure());
      }
    } on FirebaseAuthException catch(err){

      debugPrint("Facebook login error =====> ${err.code}");
      return Left(FacebookSignInFailure(message: err.code));
    }
  }
}
// {
// "name": "Open Graph Test User",
// "email": "open_jygexjs_user@tfbnw.net",
// "picture": {
// "data": {
// "height": 126,
// "url": "https://scontent.fuio21-1.fna.fbcdn.net/v/t1.30497-1/s200x200/8462.jpg",
// "width": 200
// }
// },
// "id": "136742241592917"
// }