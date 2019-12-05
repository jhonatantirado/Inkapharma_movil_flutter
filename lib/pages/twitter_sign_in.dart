import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_twitter_login/flutter_twitter_login.dart';
import 'package:inkapharma/common/shared_preferences.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
var twitterLogin = new TwitterLogin(
    consumerKey: 'jP2lCF8mZO6dBeiiQ8c8DnQgY',
    consumerSecret: '7UqvTUIzsR1I9zYYlYdyP3MzZ7I8OGGLff9ub7mIXWZW7Vv9fr',
    );

Future<FirebaseUser> signInWithTwitter() async {

  final TwitterLoginResult result = await twitterLogin.authorize();

      var session=result.session;
      final AuthCredential credential= TwitterAuthProvider.getCredential(
        authToken: session.token,
        authTokenSecret: session.secret
      );

      final AuthResult authResult = await _auth.signInWithCredential(credential);
      final FirebaseUser user = authResult.user;

      assert(user.displayName != null);
      assert(user.photoUrl != null);
      

      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final FirebaseUser currentUser = await _auth.currentUser();
      assert(user.uid == currentUser.uid);

  saveUserProfile(currentUser);

  return currentUser;
}

void signOut() async {
  await twitterLogin.logOut();
  print("User Sign Out");
}