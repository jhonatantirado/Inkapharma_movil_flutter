import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_twitter_login/flutter_twitter_login.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

String name;
String email;
String imageUrl;

var twitterLogin = new TwitterLogin(
    consumerKey: 'DwGTHNyG8MQQOMmtc0kMylK7k',
    consumerSecret: 'IOqSPbSZuwBuXWFmNWNxc6pkLjXbwwg48Go1zxGFTDJAsNwdE9',
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

      assert(user.email != null);
      assert(user.displayName != null);
      assert(user.photoUrl != null);

      name = user.displayName;
      email = user.email;
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