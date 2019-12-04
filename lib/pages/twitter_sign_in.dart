import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_twitter_login/flutter_twitter_login.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

String name;
String email;
String imageUrl;

var twitterLogin = new TwitterLogin(
    consumerKey: 'jP2lCF8mZO6dBeiiQ8c8DnQgY',
    consumerSecret: '7UqvTUIzsR1I9zYYlYdyP3MzZ7I8OGGLff9ub7mIXWZW7Vv9fr',
    );

Future<String> signInWithTwitter() async {

  final TwitterLoginResult result = await twitterLogin.authorize();

  switch (result.status) {
    case TwitterLoginStatus.loggedIn:
      var session=result.session;
      final AuthCredential credential= TwitterAuthProvider.getCredential(
        authToken: session.token,
        authTokenSecret: session.secret
      );

      final AuthResult authResult = await _auth.signInWithCredential(credential);
      final FirebaseUser user = authResult.user;

      print("twitter sign in " + user.toString());

      assert(user.displayName != null);
      assert(user.photoUrl != null);

      name = user.displayName;
      imageUrl = user.photoUrl;

      if (name.contains(" ")) {
        name = name.substring(0, name.indexOf(" "));
      }

      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final FirebaseUser currentUser = await _auth.currentUser();
      assert(user.uid == currentUser.uid);

      return 'signInWithTwitter succeeded: $user';
      break;
    case TwitterLoginStatus.cancelledByUser:
      break;
    case TwitterLoginStatus.error:
      break;
  }
return 'error';
}

void signOut() async {
  await twitterLogin.logOut();
  print("User Sign Out");
}