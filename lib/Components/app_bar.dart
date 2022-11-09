import 'package:e_attendance/main.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatefulWidget {
  String? title;
  MyAppBar({required this.title});

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage(
        "assets/nav_background.png"
        ),
      fit: BoxFit.cover,
       ),
     ),
    ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        Image.asset("assets/small_logo.png",height: 50,width: 90,),
        SizedBox(width: 10,),
      ],
      title: Text(
        widget.title!,
        style: TextStyle(
        fontSize: 16,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}
