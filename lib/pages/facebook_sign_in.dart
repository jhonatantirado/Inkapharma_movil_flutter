import 'package:flutter_facebook_login/flutter_facebook_login.dart';

final facebookLogin = FacebookLogin();

Future<String> signInWithFacebook() async {
  final result = await facebookLogin.logIn(['email']);
  switch (result.status) {
    case FacebookLoginStatus.loggedIn:
      print('Logged in');
      //_sendTokenToServer(result.accessToken.token);
      //_showLoggedInUI();
      break;
    case FacebookLoginStatus.cancelledByUser:
      print('Cancelled');
      //_showCancelledMessage();
      break;
    case FacebookLoginStatus.error:
      print('Error');
      //_showErrorOnUI(result.errorMessage);
      break;
  }

  return 'error';
}

void signOut() async {
  await facebookLogin.logOut();
  print("User Sign Out");
}