import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final FirebaseAuth _auth = FirebaseAuth.instance;
final facebookLogin = FacebookLogin();

Future<String> signInWithFacebook() async {
  final result = await facebookLogin.logIn(['email']);
  switch (result.status) {
    case FacebookLoginStatus.loggedIn:
      print('Logged in');
      final token = result.accessToken.token;
      final graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${token}');
      final profile = json.decode(graphResponse.body);
      print(profile);

      AuthCredential credential = FacebookAuthProvider.getCredential(accessToken: token);
      AuthResult signInResult = await _auth.signInWithCredential(credential);
      FirebaseUser fbUser = signInResult.user;
      print (fbUser);

      break;
    case FacebookLoginStatus.cancelledByUser:
      print('Cancelled');
      break;
    case FacebookLoginStatus.error:
      print('Error');
      break;
  }

  return 'error';
}

void signOut() async {
  await facebookLogin.logOut();
  print("User Sign Out");
}