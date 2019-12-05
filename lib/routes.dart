import 'package:inkapharma/pages/facebook_login_page.dart';
import 'package:inkapharma/pages/google_login_page.dart';
import 'package:inkapharma/pages/login_page.dart';
import 'package:inkapharma/pages/registration_page.dart';
import 'package:inkapharma/pages/twitter_login_page.dart';
import 'package:inkapharma/pages/welcome_page.dart';
import 'package:inkapharma/screen/home/home_screen.dart';
import 'package:inkapharma/screen/product/product_page.dart';

final routes = {
  '/' :          (context) => new WelcomePage(),
  WelcomePage.id: (context) => WelcomePage(),
  LoginPage.id: (context) => LoginPage(),
  RegistrationPage.id: (context) => RegistrationPage(),
  HomeScreen.id: (context) => HomeScreen(),
  GoogleLoginPage.id: (context) => GoogleLoginPage(),
  TwitterLoginPage.id: (context) => TwitterLoginPage(),
  FacebookLoginPage.id: (context) => FacebookLoginPage(),
  ProductListPage.id: (context) => ProductListPage()
};