import 'package:e_attendance/Components/buttons.dart';
import 'package:e_attendance/Screens/posting.dart';
import 'package:flutter/material.dart';

import '../Screens/attendance_status.dart';

class MyBottomNavigationBar extends StatelessWidget {

  List<String> items =[
    "ATTENDANCE STATUS",
    "POSTING",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width/2-0.5,
              child: BottomNavButton(
                  onPressed: (){
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context)=>
                              AttendanceStatus(
                                title: items[0],
                              )
                      ),
                    );
                  },
                  title: "ATTENDANCE STATUS"
              )
          ),
          SizedBox(width: 1,),
          SizedBox(
              height: 50,
              width:MediaQuery.of(context).size.width/2-0.5,
              child: BottomNavButton(
                  onPressed: (){
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context)=>
                              Posting(
                                title: items[1],
                              )
                      ),
                    );
                  },
                  title: "POSTING"
              )
          ),
        ],
      ),
    );
  }
}
