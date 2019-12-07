import 'dart:async';
import 'package:flutter/material.dart';

 showCartSnak(String msg, bool state, BuildContext context){

    Timer(Duration(seconds: 1), () {
        Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(msg,style: TextStyle(color: Colors.white),),
              backgroundColor: state? Colors.green : Colors.red,
              duration: Duration(seconds: 4),
        ));
      });

 }