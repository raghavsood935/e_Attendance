import 'package:e_attendance/Components/bottom_nav.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.tappedValue);
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

    );
  }
}
