import 'package:flutter/material.dart';

import '../app_constants.dart';

class Button extends StatelessWidget{
  String title;
  void Function()? onPressed;
  Button({required void Function()? this.onPressed,required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(primaryColor)
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class BottomNavButton extends StatelessWidget{
  String title;
  void Function()? onPressed;
  BottomNavButton({required void Function()? this.onPressed,required this.title});

@override
Widget build(BuildContext context) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ButtonStyle(
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.2)
        ),
      ),
        backgroundColor: MaterialStateProperty.all(navColor)
    ),
    child: Center(
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
        ),
      ),
    ),
  );
}
}