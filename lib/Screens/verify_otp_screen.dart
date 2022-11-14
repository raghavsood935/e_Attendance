import 'package:e_attendance/Screens/dashboard_screen.dart';
import 'package:e_attendance/api_calls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Components/buttons.dart';
import '../Components/loader.dart';
import '../app_constants.dart';

class VerifyOTP extends StatefulWidget {
  String? empCode;
  VerifyOTP({required this.empCode});
  @override
  State<VerifyOTP> createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
String? otp;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Employee Code ${widget.empCode}");
  }
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
                          otp=value;
                          print(otp);
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
                                  print(otp!.length);
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Dialog(
                                          backgroundColor: Colors.transparent
                                              .withOpacity(0.5),
                                          child: const LocationShimmer(
                                              height: 30,
                                              width: 100,
                                              string: "Validating"),
                                        );
                                      });
                                 await verifyEmployeeData(widget.empCode!, otp!).then((value) {
                                    if(value['status']=="success"){
                                      Navigator.pushReplacement(
                                        context, MaterialPageRoute(
                                          builder: (context)=>Dashboard()
                                        ),
                                      );
                                      Fluttertoast.showToast(
                                          msg: "OTP verified",
                                      );
                                    }else{
                                      Fluttertoast.showToast(
                                          msg: "Wrong OTP Entered, Please Try Again"
                                      );
                                      Navigator.pop(context);
                                    }
                                  });
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
