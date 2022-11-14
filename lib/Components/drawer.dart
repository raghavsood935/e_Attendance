import 'package:e_attendance/Components/bottom_sheet.dart';
import 'package:e_attendance/Screens/attendance_status.dart';
import 'package:e_attendance/Screens/dashboard_screen.dart';
import 'package:e_attendance/Screens/posting.dart';
import 'package:e_attendance/app_constants.dart';
import 'package:flutter/material.dart';

import '../api_calls.dart';

class MyAppDrawer extends StatefulWidget {
  String? empName;
  String? empCode;
  int? tappedValue;
  MyAppDrawer({required this.tappedValue,required this.empName,required this.empCode});
  @override
  State<MyAppDrawer> createState() => _MyAppDrawerState();
}

class _MyAppDrawerState extends State<MyAppDrawer> {
  List<String> items =[
    "DASHBOARD",
    "ATTENDANCE STATUS",
    "POSTING",
    "LOGOUT"
  ];

  int tapped=0;
  final rowSpacer=TableRow(
      children: [
        SizedBox( height: 10, ),
        SizedBox( height: 10, ),
        SizedBox( height: 10, )
      ]
  );

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.empCode);
    print(widget.empName);
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Drawer(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Container(
                height: 220,
                width: width,
                child: Image.asset(
                    "assets/ic_splash_background.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 40,
              right: 10,
              left: 10,
              child: Column(
                children: [
                  Image.asset(
                  "assets/ic_logo.png",
                  height: 90,
                  width: 200,
                ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Table(
                        columnWidths: {
                          0: FlexColumnWidth(2.5),
                          1: FlexColumnWidth(1),
                          2: FlexColumnWidth(6),
                        },
                        children: [
                          TableRow(
                            children: [
                              Text(
                                "EMP ID",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                ":",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                widget.empCode!,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15
                                ),
                              ),
                            ],
                          ),
                          rowSpacer,
                          TableRow(
                          children: [
                            Text(
                              "NAME",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              ":",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              widget.empName!,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ],
                      ),
                    ),
                  ),
               ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 180),
              child: ListView(
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        tapped=0;
                      });
                      Navigator.of(context).pop();
                      Navigator.pushReplacement(
                        context, MaterialPageRoute(
                          builder: (context)=>
                              Dashboard(empCode: widget.empCode,)
                        ),
                      );
                      print("Tapped");
                    },
                    child: Container(
                      height: 50,
                      width: width,
                      decoration: BoxDecoration(
                        color: tapped ==0 ? Colors.grey.shade300 : Colors.transparent,
                      ),
                      child: ListTile(
                        title: Text(
                          items[0],
                          style: TextStyle(
                           fontWeight: FontWeight.bold
                         ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      print(widget.empCode);
                      setState(() {
                        tapped=1;
                      });
                      Navigator.of(context).pop();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context)=>
                              AttendanceStatus(
                                title: items[1],
                                empCode: widget.empCode
                              )
                      ),
                      );
                      print("Tapped On ${items[1]}");
                    },
                    child: Container(
                      height: 50,
                      width: width,
                      decoration: BoxDecoration(
                        color: tapped ==1 ? Colors.grey.shade300 : Colors.transparent,
                      ),
                      child: ListTile(
                        title: Text(
                          items[1],
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      print(widget.empCode);
                      print(items[2]);
                      setState(() {
                        tapped=2;
                      });
                      Navigator.of(context).pop();
                      Navigator.pushReplacement(
                        context, MaterialPageRoute(
                          builder: (context)=>
                              Posting(
                                title: items[2],
                                empCode: widget.empCode,
                              )
                      ),
                      );
                      print(items[2]);
                    },
                    child: Container(
                      height: 50,
                      width: width,
                      decoration: BoxDecoration(
                        color: tapped ==2 ? Colors.grey.shade300 : Colors.transparent,
                      ),
                      child: ListTile(
                        title: Text(
                          items[2],
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        tapped=3;
                      });
                      print("Tapped");
                      Navigator.pop(context);
                      LogoutBottomSheet(context);
                    },
                    child: Container(
                      height: 50,
                      width: width,
                      decoration: BoxDecoration(
                        color: tapped ==3 ? Colors.grey.shade300 : Colors.transparent,
                      ),
                      child: ListTile(
                        title: Text(
                          items[3],
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                  child: Text("Version :",
                    style: TextStyle(fontSize: 17),
                  ),
              ),
            )
          ],
        )
    );
  }
}
