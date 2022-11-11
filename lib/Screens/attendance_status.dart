import 'package:e_attendance/Components/bottom_nav.dart';
import 'package:e_attendance/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Components/app_bar.dart';
import '../Components/drawer.dart';
import 'package:table_calendar/table_calendar.dart';

class AttendanceStatus extends StatefulWidget {
  String? title;
  AttendanceStatus({required this.title});

  @override
  State<AttendanceStatus> createState() => _AttendanceStatusState();
}

class _AttendanceStatusState extends State<AttendanceStatus> {
  bool tappedList=false,tappedGrid=false;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

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
        tappedValue: 1,
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
            child: tappedList?
            Column(
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
            ):Container(
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
                  SizedBox(
                    height: 35,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        color: presentColor,
                      ),
                      SizedBox(width: 7,),
                      Text(
                        "PRESENT",
                        style: TextStyle(
                          fontSize: 12
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 20,
                        width: 20,
                        color: absentColor,
                      ),
                      SizedBox(width: 7,),
                      Text(
                        "ABSENT",
                        style: TextStyle(
                            fontSize: 12
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: TableCalendar(
                      focusedDay: selectedDay,
                      firstDay: DateTime(1990),
                      lastDay: DateTime(2050),

                      //changing calendar format
                      calendarFormat: format,
                      onFormatChanged: (CalendarFormat _format) {
                        setState(() {
                          format = _format;
                        });
                      },
                      startingDayOfWeek: StartingDayOfWeek.monday,
                      daysOfWeekVisible: true,

                      //Day Changed on select
                      onDaySelected: (DateTime selectDay, DateTime focusDay) {
                        setState(() {
                          selectedDay = selectDay;
                          focusedDay = focusDay;
                        });
                        print(focusedDay);
                      },
                      selectedDayPredicate: (DateTime date) {
                        return isSameDay(selectedDay, date);
                      },
                      calendarStyle: CalendarStyle(
                        defaultTextStyle: TextStyle(
                          fontFamily: secondaryFont
                        ),
                        isTodayHighlighted: true,
                        selectedDecoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        selectedTextStyle: TextStyle(color: Colors.white),
                        todayDecoration: BoxDecoration(
                          color: Colors.purpleAccent,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        defaultDecoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        weekendDecoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      headerStyle: HeaderStyle(
                        leftChevronIcon: Icon(Icons.arrow_back,color: Colors.red,),
                        rightChevronIcon: Icon(Icons.arrow_forward,color: Colors.red,),
                        titleTextStyle: TextStyle(
                          fontFamily: GoogleFonts.montserrat().fontFamily,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                        formatButtonVisible: true,
                        titleCentered: true,
                        formatButtonShowsNext: false,
                        formatButtonDecoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        formatButtonTextStyle: TextStyle(
                          color: Colors.white,
                          fontFamily: secondaryFont,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                      daysOfWeekStyle: DaysOfWeekStyle(
                        weekdayStyle: TextStyle(
                          color: Colors.grey.shade700,
                          fontFamily: secondaryFont,
                          fontWeight: FontWeight.bold,
                        ),
                        weekendStyle: TextStyle(
                          color: Colors.grey.shade700,
                          fontFamily: secondaryFont,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
