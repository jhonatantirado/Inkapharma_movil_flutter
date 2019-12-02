import 'package:flutter/material.dart';
import 'package:inkapharma/pages/welcome_page.dart';
import 'package:inkapharma/routes.dart';
import 'package:inkapharma/common/app_constants.dart';

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
      initialRoute: WelcomePage.id,
      routes: routes,
    );
  }
}
