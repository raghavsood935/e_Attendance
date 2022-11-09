import 'package:e_attendance/Components/buttons.dart';
import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width/2-0.5,
              child: BottomNavButton(
                  onPressed: (){},
                  title: "ATTENDANCE STATUS"
              )
          ),
          SizedBox(width: 1,),
          SizedBox(
              height: 50,
              width:MediaQuery.of(context).size.width/2-0.5,
              child: BottomNavButton(
                  onPressed: (){},
                  title: "POSTING"
              )
          ),
        ],
      ),
    );
  }
}
