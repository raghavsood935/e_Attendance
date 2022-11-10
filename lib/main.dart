import 'package:e_attendance/Screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Attendance',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.josefinSans().fontFamily,
      ),
      home: SplashScreen(),
    );
  }
}
