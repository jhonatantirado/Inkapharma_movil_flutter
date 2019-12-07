import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:inkapharma/common/shared_preferences.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final facebookLogin = FacebookLogin();


Future<FirebaseUser> signInWithFacebook() async {
  final result = await facebookLogin.logIn(['email']);

      print('Logging in');
      final token = result.accessToken.token;
      final graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${token}');
      final profile = json.decode(graphResponse.body);
      print(profile);
      final AuthCredential credential = FacebookAuthProvider.getCredential(accessToken: token);
      final AuthResult authResult = await _auth.signInWithCredential(credential);
      final FirebaseUser user = authResult.user;

      assert(user.providerData[1].email != null);
      assert(user.displayName != null);
      assert(user.photoUrl != null);

      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final FirebaseUser currentUser = await _auth.currentUser();
      assert(user.uid == currentUser.uid);

  saveUserProfile(currentUser);
  return currentUser;
}

void signOutFacebook() async {
  await facebookLogin.logOut();
  print("User Sign Out");
}