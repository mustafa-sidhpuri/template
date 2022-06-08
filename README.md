# template

temlate by techy panther

## Getting Started

reference for google sign in using firebase: https://www.youtube.com/watch?v=1k-gITZA9CI <br>
reference for facebook sign in using firebase: https://www.youtube.com/watch?v=PweQbVgR9iI <br>
<br>
All the classes have been initialized in injection.dart using get_it package. To use the classes see the example below: <br>

- FirebaseGoogleSignIn: sl<FirebaseGoogleSignIn>().

<br>
Also add following lines in main() before runApp
- import "injections.dart"
- await di.init()