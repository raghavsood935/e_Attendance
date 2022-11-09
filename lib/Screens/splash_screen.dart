import 'package:flutter/material.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:page_transition/page_transition.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setOptimalDisplayMode();
    Future.delayed(
        Duration(seconds: 3),(){
          Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context)=>
              LoginScreen()
             )
          );
      }
    );
  }

  Future<void> setOptimalDisplayMode() async {
    final List<DisplayMode> supported = await FlutterDisplayMode.supported;
    final DisplayMode active = await FlutterDisplayMode.active;

    final List<DisplayMode> sameResolution = supported.where(
            (DisplayMode m) => m.width == active.width
            && m.height == active.height).toList()..sort(
            (DisplayMode a, DisplayMode b) =>
            b.refreshRate.compareTo(a.refreshRate));

    final DisplayMode mostOptimalMode = sameResolution.isNotEmpty
        ? sameResolution.first
        : active;

    await FlutterDisplayMode.setPreferredMode(mostOptimalMode);
  }
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
