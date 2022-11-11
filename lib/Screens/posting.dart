import 'package:e_attendance/Components/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../Components/app_bar.dart';
import '../Components/drawer.dart';
import '../app_constants.dart';

class Posting extends StatefulWidget {
  String? title;
  Posting({required this.title});

  @override
  State<Posting> createState() => _PostingState();
}

class _PostingState extends State<Posting> {
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      drawer: MyAppDrawer(
        tappedValue: 2,
      ),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: MyAppBar(
              title: widget.title
          )
    ),
      bottomNavigationBar: MyBottomNavigationBar(),
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
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
                    "ALLOCATED",
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
                    "NOT ALLOCATED",
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
                        fontFamily: secondaryFont,
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
    );
  }
}