import 'package:inkapharma/pages/login_page.dart';
import 'package:inkapharma/pages/registration_page.dart';
import 'package:inkapharma/pages/welcome_page.dart';
import 'package:inkapharma/screen/home/home_screen.dart';

final routes = {
  '/' :          (context) => new WelcomePage(),
  WelcomePage.id: (context) => WelcomePage(),
  LoginPage.id: (context) => LoginPage(),
  RegistrationPage.id: (context) => RegistrationPage(),
  HomeScreen.id: (context) => HomeScreen(),
};