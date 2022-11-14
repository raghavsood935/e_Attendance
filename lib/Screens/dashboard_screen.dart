import 'package:e_attendance/Components/app_bar.dart';
import 'package:e_attendance/Components/bottom_nav.dart';
import 'package:e_attendance/Components/drawer.dart';
import 'package:e_attendance/api_calls.dart';
import 'package:e_attendance/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Dashboard extends StatefulWidget {
  String? empCode;
  Dashboard({required this.empCode});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool _loading = false;
  String postingDate="";
  dynamic roasters;
  @override
  void initState() {
    //TODO: implement initState
    super.initState();
    init();
  }

  Future<void> init () async{
    _loading= true;
    await getRoasters(widget.empCode!)
        .then((value){
      setState(() {
        roasters = value;
        _loading=false;
      });
    });
    print(roasters);
    String fetchedDate = roasters["data"][0]["posting_date"];
    postingDate = fetchedDate.toString().split("-").reversed.join("-");
  }

  final rowSpacer=TableRow(
      children: [
        SizedBox( height: 30, ),
        SizedBox( height: 30, ),
        SizedBox( height: 30, )
      ]
  );
  String header = "PROFILE DETAILS";
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if(_loading){
      return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              color: primaryColor,
              strokeWidth: 2,
            ),
          ),
        ),
      );
    }
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      drawer: MyAppDrawer(
        tappedValue: 0,
        empName: roasters["data"][0]["emp_name"],
        empCode: roasters["data"][0]["employee_code"],
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
                     onTap: (){
                       Navigator.pushReplacement(
                         context, MaterialPageRoute(
                           builder: (context)=>Dashboard(empCode: widget.empCode!)
                         ),
                       );
                     },
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
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: SingleChildScrollView(
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 25,
                                vertical: 20
                            ),
                            child: Container(
                                        child: Table(
                                            columnWidths: {
                                              0: FlexColumnWidth(5),
                                              1: FlexColumnWidth(3),
                                              2: FlexColumnWidth(5),
                                            },
                                            children: [
                                              rowSpacer,
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
                                                roasters["data"][0]["roaster_type"]=="regular"
                                                    ? Text(
                                                      "ALOTTED",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 17,
                                                    color: Colors.red
                                                  ),
                                                    ):Text(roasters["data"][0]["roaster_type"])
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
                                                  Text(
                                                      roasters["data"][0]["site_name"],
                                                  style: TextStyle(
                                                    height: 1.3,
                                                    color: Colors.grey.shade600,
                                                    fontSize: 14,
                                                   ),
                                                  )
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
                                                    roasters["data"][0]["site_code"],
                                                    style: TextStyle(
                                                        height: 1.3,
                                                        color: Colors.grey.shade600,
                                                        fontSize: 14
                                                    ),
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
                                                    roasters["data"][0]["shift_time"]
                                                        .toString().toUpperCase(),
                                                    style: TextStyle(
                                                        height: 1.3,
                                                        color: Colors.grey.shade600,
                                                        fontSize: 14
                                                    ),
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
                                                    roasters["data"][0]["site_address"].toString().toUpperCase(),
                                                    style: TextStyle(
                                                        height: 1.3,
                                                        color: Colors.grey.shade600,
                                                        fontSize: 14
                                                    ),
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
                                                    postingDate,
                                                    style: TextStyle(
                                                        height: 1.3,
                                                        color: Colors.grey.shade600,
                                                        fontSize: 15
                                                    ),
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
                                                    roasters["data"][0]["category"]
                                                        .toString().toUpperCase(),
                                                    style: TextStyle(
                                                        height: 1.3,
                                                        color: Colors.grey.shade600,
                                                        fontSize: 15
                                                    ),
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
                                                    roasters["data"][0]["attendance_provided_status"]["login_time"]
                                                        .toString().toUpperCase(),
                                                    style: TextStyle(
                                                        height: 1.3,
                                                        color: Colors.grey.shade600,
                                                        fontSize: 15
                                                    ),
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
      bottomNavigationBar: MyBottomNavigationBar(empCode: widget.empCode,),
    );
  }
}
