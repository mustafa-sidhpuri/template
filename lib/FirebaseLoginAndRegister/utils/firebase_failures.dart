abstract class FirebaseFailure{
  String? message;
  FirebaseFailure({this.message});
}


class FacebookSignInFailure extends FirebaseFailure{


  FacebookSignInFailure({String message="Facebook sign in error"}) : super(message: message);
}

class GoogleSignInFailure extends FirebaseFailure{


  GoogleSignInFailure({String message="Google sign in error"}): super(message: message);
}

class PhoneSignInFailure extends FirebaseFailure{

  PhoneSignInFailure({String message="Phone sign in error"}): super(message: message);
}

class EmailSignInFailure extends FirebaseFailure{

  EmailSignInFailure({String message="Email sign in error"}): super(message: message);
}

class EmailRegisterFailure extends FirebaseFailure{

  EmailRegisterFailure({String message="Email Register error"}): super(message: message);
}

