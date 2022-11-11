import 'package:e_attendance/Screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../Components/buttons.dart';
import '../app_constants.dart';

class VerifyOTP extends StatefulWidget {
  const VerifyOTP({Key? key}) : super(key: key);

  @override
  State<VerifyOTP> createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
  @override
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Image.asset(
            "assets/ic_splash_background.png",
            fit: BoxFit.fill,
            height: height,
            width: width,
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: width,
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                      child: Text(
                        "OTP VERIFICATION",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                              "Enter your last OTP/Password which we have sent for Mobile Number Verification",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15
                            ),
                          ),
                    ),
                    Spacer(),
                    SizedBox(
                      height: 40,
                      child: OtpTextField(
                        onCodeChanged: (value){
                          print(value);
                        },
                        onSubmit: (value){
                          print(value);
                        },
                        cursorColor: Colors.black,
                        showFieldAsBox: true,
                        enabledBorderColor: Colors.white38,
                        focusedBorderColor: primaryColor,
                      ),
                    ),
                    Spacer(),
                    Center(
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: SizedBox(
                            width: 150,
                            height: 40,
                            child: Button(
                                title: "VERIFY",
                                onPressed: () async {
                                  Navigator.pushReplacement(
                                    context, MaterialPageRoute(
                                      builder: (context)=>Dashboard()
                                  ),
                                  );
                                }
                            )
                          )
                      ),
                    ),
                    Spacer()
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 100,
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
      ),
    );
  }
}
