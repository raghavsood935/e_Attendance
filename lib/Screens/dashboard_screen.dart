import 'package:e_attendance/Components/app_bar.dart';
import 'package:e_attendance/Components/drawer.dart';
import 'package:e_attendance/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      drawer: MyAppDrawer(),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: MyAppBar()
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
             Container(
               height: 50,
               width: width,
               color: Colors.white,
               child: Align(
                 alignment: Alignment.centerRight,
                 child: Padding(
                   padding: EdgeInsets.symmetric(horizontal: 25),
                   child:  GestureDetector(
                     onTap: (){},
                     child: Image.asset(
                       "assets/refresh.png",
                       color: primaryColor,
                       height: 35,
                       width: 35,
                     ),
                   ),
                 ),
               ),
             )
          ],
        ),
      ),
    );
  }
}
