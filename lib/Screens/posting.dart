import 'package:e_attendance/Components/bottom_nav.dart';
import 'package:flutter/material.dart';
import '../Components/app_bar.dart';
import '../Components/drawer.dart';

class Posting extends StatefulWidget {
  String? title;
  Posting({required this.title});

  @override
  State<Posting> createState() => _PostingState();
}

class _PostingState extends State<Posting> {
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
    );
  }
}