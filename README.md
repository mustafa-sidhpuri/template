# template

temlate by techy panther

## Getting Started

reference for google sign in using firebase: https://www.youtube.com/watch?v=1k-gITZA9CI <br>
reference for facebook sign in using firebase: https://www.youtube.com/watch?v=PweQbVgR9iI <br>
<br>
All the classes have been initialized in injection.dart using get_it package. To use the classes see the example below: <br>

- FirebaseGoogleSignIn: sl<FirebaseGoogleSignIn>().

<br>
Also add following lines in main() before runApp <br>
- import "injections.dart"
- await di.init()

<br>

add following dependencies.
<br>
#### FirebaseLoginAndRegister
- firebase_auth: ^3.3.19
- firebase_core: ^1.17.1
- firebase_storage: ^10.2.17
#### shared preferences
- shared_preferences: ^2.0.15
#### google sign in
- google_sign_in: 5.3.3
#### facebook sign in
- flutter_facebook_auth: ^4.3.4+1
#### others
- dartz: 0.10.1
- get_it: ^7.2.0