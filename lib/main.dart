import 'package:flutter/material.dart';
import 'package:todo_app/routes.dart';
import 'package:todo_app/common/app_constants.dart';
import 'package:todo_app/pages/facebook_login_page.dart';
import 'package:todo_app/pages/google_login_page.dart';
import 'package:todo_app/pages/twitter_login_page.dart';
import 'package:todo_app/pages/welcome_page.dart';
import 'package:todo_app/pages/login_page.dart';
import 'package:todo_app/pages/registration_page.dart';
import 'package:todo_app/pages/chat_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Roboto",
        primarySwatch: AppConstants.primaryColor,
      ),
      routes: routes,
    );
  }
}
