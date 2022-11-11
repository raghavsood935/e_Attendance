import 'package:e_attendance/Components/app_bar.dart';
import 'package:e_attendance/Components/bottom_nav.dart';
import 'package:e_attendance/Components/drawer.dart';
import 'package:e_attendance/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final rowSpacer=TableRow(
      children: [
        SizedBox( height: 50, ),
        SizedBox( height: 50, ),
        SizedBox( height: 50, )
      ]
  );
  String header = "PROFILE DETAILS";
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      drawer: MyAppDrawer(
        tappedValue: 0,
      ),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: MyAppBar(title: header,)
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
             ),
            Expanded(
              child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Container(
                      height: 700,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 25,
                              vertical: 45
                          ),
                          child:  Container(
                                    child: Table(
                                      columnWidths: {
                                        0: FlexColumnWidth(4),
                                        1: FlexColumnWidth(2),
                                        2: FlexColumnWidth(5),
                                      },
                                      children: [
                                        TableRow(
                                        children: [
                                          Text(
                                              "ROASTER TYPE",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          Text("       :",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17
                                           ),
                                          ),
                                          Text(
                                                "",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17,
                                              color: Colors.red
                                            ),
                                              )

                                        ],
                                      ),
                                        rowSpacer,
                                        TableRow(
                                          children: [
                                            Text(
                                              "SITE NAME",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                            Text("       :",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17
                                              ),
                                            ),
                                            Text("")
                                          ],
                                        ),
                                        rowSpacer,
                                        TableRow(
                                          children: [
                                            Text(
                                              "SITE CODE",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                            Text("       :",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17
                                              ),
                                            ),
                                             Text(
                                                  "",
                                                )

                                          ],
                                        ),
                                        rowSpacer,
                                        TableRow(
                                          children: [
                                            Text(
                                              "SITE SHIFT",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                            Text("       :",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17
                                              ),
                                            ),
                                            Text(
                                                  "",
                                                )

                                          ],
                                        ),
                                        rowSpacer,
                                        TableRow(
                                          children: [
                                            Text(
                                              "SITE ADDRESS",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                            Text("       :",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17
                                              ),
                                            ),
                                            Text(
                                                  "",
                                                )

                                          ],
                                        ),
                                        rowSpacer,
                                        TableRow(
                                          children: [
                                            Text(
                                              "POSTING DATE",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                            Text("       :",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17
                                              ),
                                            ),
                                             Text(
                                                  "",
                                                )

                                          ],
                                        ),
                                        rowSpacer,
                                        TableRow(
                                          children: [
                                            Text(
                                              "CATEGORY",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                            Text("       :",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17
                                              ),
                                            ),
                                            Text(
                                                  "",
                                                )

                                          ],
                                        ),
                                        rowSpacer,
                                        TableRow(
                                          children: [
                                            Text(
                                              "TIME IN",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                            Text("       :",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17
                                              ),
                                            ),
                                            Text(
                                                  "",
                                                )
                                          ],
                                        ),
                                     ],
                                    ),
                                  ),
                          ),
                      ),
                          ),
                      ),
                    ),

          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
