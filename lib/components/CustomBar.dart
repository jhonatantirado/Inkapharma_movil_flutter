import 'package:flutter/material.dart';
 

class CustomBar extends StatelessWidget implements PreferredSizeWidget {
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.red[300],
          child: Padding(
            padding: EdgeInsets.all(1),
            child: AppBar(
                    title: Container(
                      color: Colors.white,
                      child: TextField(decoration: InputDecoration(hintText: "Product",contentPadding: EdgeInsets.all(4))),
                    ),
                    actions: [
                      IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {            
                        },
                      ),
                    ],
                  ) ,
          ),
        ),
      ],
    );
  }
  
 @override
  Size get preferredSize => Size.fromHeight(70);
}