

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'FirebaseLoginAndRegister/FirebaseLogins/firebase_email_password_sign_in.dart';
import 'FirebaseLoginAndRegister/FirebaseLogins/firebase_facebook_sign_in.dart';
import 'FirebaseLoginAndRegister/FirebaseLogins/firebase_google_sign_in.dart';
import 'FirebaseLoginAndRegister/FirebaseLogins/firebase_phone_and_otp_sign_in.dart';

final sl = GetIt.instance;

Future init() async{
  // FirebaseLoginAndRegister google login
  sl.registerLazySingleton(() => FirebaseGoogleSignIn(firebaseAuth: sl(), googleSignIn: sl()));

  // FirebaseLoginAndRegister facebook login
  sl.registerLazySingleton(() => FirebaseFacebookSignIn(facebookAuth: sl(), firebaseAuth: sl()));

  // email password login
  sl.registerLazySingleton(() => FirebaseEmailPasswordSignIn(firebaseAuth: sl()));

  // phone
  sl.registerLazySingleton(() => FirebasePhoneAndOTPSignIn(firebaseAuth: sl()));

  //facebook
  sl.registerLazySingleton(() => FacebookAuth.instance);
  // google
  sl.registerLazySingleton(() => GoogleSignIn());

  // FirebaseLoginAndRegister
  sl.registerLazySingleton(() => FirebaseAuth.instance);



}