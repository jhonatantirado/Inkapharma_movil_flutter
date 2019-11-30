import 'package:flutter/material.dart';
import 'package:todo_app/components/rounded_button.dart';
import 'package:todo_app/pages/facebook_login_page.dart';
import 'package:todo_app/pages/google_login_page.dart';
import 'package:todo_app/pages/registration_page.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:todo_app/pages/twitter_login_page.dart';
import 'login_page.dart';

class WelcomePage extends StatefulWidget {
  static const String id = 'welcome_page';
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);

    controller.forward();

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value, //Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('assets/images/logo.png'),
                    height: 60.0, //animation.value * 100,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: ['Flash Chat'],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              title: 'Email Log In',
              color: Colors.lightBlueAccent,
              onPressed: () {
                Navigator.pushNamed(context, LoginPage.id);
              },
            ),
            RoundedButton(
              title: 'Email Register',
              color: Colors.blueAccent,
              onPressed: () {
                Navigator.pushNamed(context, RegistrationPage.id);
              },
            ),
            RoundedButton(
              title: 'Google Login',
              color: Colors.blueAccent,
              onPressed: () {
                Navigator.pushNamed(context, GoogleLoginPage.id);
              },
            ),
            RoundedButton(
              title: 'Twitter Login',
              color: Colors.blueAccent,
              onPressed: () {
                Navigator.pushNamed(context, TwitterLoginPage.id);
              },
            ),
            RoundedButton(
              title: 'Facebook Login',
              color: Colors.blueAccent,
              onPressed: () {
                Navigator.pushNamed(context, FacebookLoginPage.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
