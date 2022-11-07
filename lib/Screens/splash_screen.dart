import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Image.asset(
          "assets/ic_splash_background.png",
          fit: BoxFit.fill,
          height: height,
          width: width,
              ),
        Positioned(
          bottom: 330,
          left: 10,
          right: 10,
          child: Image.asset(
              "assets/ic_logo.png",
              height: 115,
              width: 115,
          ),
        ),
        Positioned(
          bottom: 20,
          left: 10,
          right: 10,
          child: Image.asset("assets/ic_text_logo.png"),
        ),
        Positioned(
          bottom: 20,
          left: 40,
          right: 40,
          child: Image.asset("assets/ic_full_form_text_logo.png"),
        )
      ],
    );
  }
}
