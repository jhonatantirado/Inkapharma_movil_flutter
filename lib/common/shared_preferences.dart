import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:inkapharma/model/UserProfile.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future <String> read(String key) async {
  final prefs = await SharedPreferences.getInstance();
  final value = prefs.getString(key) ?? null;
  return value;
}

save(String key, dynamic value) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString(key, json.encode(value));
  print('saved $value');
}

saveUserProfile(FirebaseUser user){
  UserProfile myself = UserProfile(user.displayName,user.photoUrl,user.providerData[1].email);
  save('currentUser', myself);
}
