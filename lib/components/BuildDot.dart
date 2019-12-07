import 'package:flutter/material.dart';

class BuildDot extends StatelessWidget {
 final int index;
 final int number;

const BuildDot(this.index, this.number);

 @override
 Widget build(BuildContext context) {

   return Padding(
      padding: EdgeInsets.all(5.0),
      child: Container(
        height: 10.0,
        width: 10.0,
        decoration: BoxDecoration(
            color: (number == index ) ? Colors.black38 : Colors.grey[200],
            shape: BoxShape.circle
        ),
      ),
    );
 }
 
}