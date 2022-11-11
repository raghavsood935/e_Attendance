import 'package:e_attendance/Components/buttons.dart';
import 'package:e_attendance/Screens/verify_otp_screen.dart';
import 'package:e_attendance/api_calls.dart';
import 'package:e_attendance/app_constants.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';

import '../Components/loader.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var tapped = false;
  var message;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
          child: Stack(
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
                            "EMPLOYEE ID",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            fontSize: 14,
                              color: Colors.black
                           ),
                          ),
                        ),
                        Spacer(),
                        Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: TextFormField(
                                autofocus: false,
                                cursorHeight: 25,
                                controller: controller,
                                cursorColor: primaryColor,
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: primaryColor),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Employee ID cannot be Empty";
                                  }
                                }
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
                                  title: "LOGIN",
                                  onPressed: () async {
                                   // if (_formKey.currentState!.validate()) {
                                   //   getEmployeeData(controller.text, 'new')
                                   //       .then((value){
                                   //     print(value);
                                   //   });
                                   //   Navigator.push(
                                   //     context, MaterialPageRoute(
                                   //       builder: (context) => VerifyOTP()
                                   //   ),
                                   //   );
                                   //  }
                                   if (_formKey.currentState!.validate()) {
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
                                     await getEmployeeData(controller.text)
                                         .then((value) {
                                       print(value['status']);
                                       if(value['status']=="success"){
                                          Navigator.push(
                                           context, MaterialPageRoute(
                                             builder: (context) => VerifyOTP()
                                         ),
                                         );
                                       }else if(value['status']=="failure"){
                                         print("Error");
                                         Navigator.pop(context);
                                         setState(() {
                                           Fluttertoast.showToast(
                                               msg: "Incorrect Employee ID"
                                           );
                                         });
                                       }
                                     });
                                   }
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
        ),
    );
  }
}
