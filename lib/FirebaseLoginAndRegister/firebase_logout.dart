import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseLogOut{
  GoogleSignIn googleSignIn;
  FirebaseAuth firebaseAuth;

  FirebaseLogOut({required this.googleSignIn, required this.firebaseAuth});

  Future googleLogOut()async{
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}