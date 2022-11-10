import 'package:e_attendance/Components/bottom_nav.dart';
import 'package:e_attendance/app_constants.dart';
import 'package:flutter/material.dart';
import '../Components/app_bar.dart';
import '../Components/drawer.dart';

class AttendanceStatus extends StatefulWidget {
  String? title;
  int? tappedValue;
  AttendanceStatus({required this.title,this.tappedValue});

  @override
  State<AttendanceStatus> createState() => _AttendanceStatusState();
}

class _AttendanceStatusState extends State<AttendanceStatus> {
  bool tappedList=false,tappedGrid=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tappedList=true;
    tappedGrid=false;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      drawer: MyAppDrawer(
        tappedValue: widget.tappedValue,
      ),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: MyAppBar(
              title: widget.title
          )
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            color: Colors.grey.shade300,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              tappedGrid=true;
                              tappedList=false;
                            });
                          },
                          child: Row(
                            children: [
                            Image.asset(
                                "assets/ic_grid_blue.png",
                              height: 20,
                              width: 20,
                              color: tappedGrid? primaryColor : Colors.grey,
                            ),
                              SizedBox(width: 5,),
                              Text(
                                  "GRID VIEW",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                               color: tappedGrid? primaryColor : Colors.black,
                                fontSize: 12
                              ),
                              )
                             ]
                          ),
                        ),
                        SizedBox(width: 15,),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              tappedList=true;
                              tappedGrid=false;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,//Center Row contents horizontally,
                            crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/ic_list_blue.png",
                                  height: 23,
                                  width: 23,
                                  color: tappedList? primaryColor : Colors.grey,
                                ),
                                SizedBox(width: 5,),
                                Text(
                                  "LIST VIEW",
                                  style: TextStyle(
                                      color: tappedList? primaryColor : Colors.black,
                                      fontSize: 12
                                  ),
                                )
                              ]
                          ),
                        ),
                      ],
                    ),
                  ),
                SizedBox(height: 15,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: primaryColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                            "Work Report",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white
                        ),
                        ),
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                Container(
                  width: 1000,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Table(
                          columnWidths: {
                            1: FlexColumnWidth(0.5),
                            3: FlexColumnWidth(0.5),
                            5: FlexColumnWidth(0.5),
                            6: FlexColumnWidth(1.5),
                            7: FlexColumnWidth(0.5),
                            9: FlexColumnWidth(0.5),
                            11: FlexColumnWidth(0.5),
                            12: FlexColumnWidth(1),
                          },
                          children: [
                            TableRow(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                    "Date",
                                  style: TextStyle(
                                  fontSize: 11
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                                child: VerticalDivider(
                                  color: Colors.black,
                                  thickness: 1,
                                  indent: 0,
                                  endIndent: 10,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 5),
                                child: Text(
                                    "In Time",
                                    style: TextStyle(
                                    fontSize: 11
                                   ),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                                child: VerticalDivider(
                                  color: Colors.black,
                                  thickness: 1,
                                  indent: 0,
                                  endIndent: 10,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                child: Text(
                                    "Out Time",
                                  style: TextStyle(
                                      fontSize: 11
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                                child: VerticalDivider(
                                  color: Colors.black,
                                  thickness: 1,
                                  indent: 0,
                                  endIndent: 10,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                    "Deviation",
                                  style: TextStyle(
                                      fontSize: 11
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                                child: VerticalDivider(
                                  color: Colors.black,
                                  thickness: 1,
                                  indent: 0,
                                  endIndent: 10,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                child: Text(
                                    "Site Code",
                                  style: TextStyle(
                                      fontSize: 11
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                                child: VerticalDivider(
                                  color: Colors.black,
                                  thickness: 1,
                                  indent: 0,
                                  endIndent: 10,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                child: Text(
                                    "Site Name",
                                  style: TextStyle(
                                      fontSize: 11
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                                child: VerticalDivider(
                                  color: Colors.black,
                                  thickness: 1,
                                  indent: 0,
                                  endIndent: 10,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                    "Shift",
                                  style: TextStyle(
                                      fontSize: 11
                                  ),
                                ),
                              ),
                            ],
                          ),
                         ],
                        ),
                      ),
                    ),
                  ),
                Expanded(
                  child: Container(
                  width: 1000,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    color: Colors.white
                    ),
                    child: SingleChildScrollView(
                         child: Padding(
                           padding: EdgeInsets.symmetric(horizontal: 10),
                           child: Text(
                             ""
                           )
                         )
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
