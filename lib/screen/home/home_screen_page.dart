import 'package:flutter/material.dart';

class HomeScreenPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageScreenState();
}

class HomePageScreenState extends State<HomeScreenPage> {

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: new Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage('assets/home.PNG'),
            fit: BoxFit.cover
          ),
        ),
      )

    );
  }

}