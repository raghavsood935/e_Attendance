import 'package:flutter/material.dart';

class MyAppBar extends StatefulWidget {
  const MyAppBar({Key? key}) : super(key: key);

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
      title: Text("PROFILE DETAILS",style: TextStyle(
        fontSize: 18
        ),
      ),
    );
  }
}
