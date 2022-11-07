import 'package:flutter/material.dart';

class MyAppDrawer extends StatefulWidget {
  const MyAppDrawer({Key? key}) : super(key: key);

  @override
  State<MyAppDrawer> createState() => _MyAppDrawerState();
}

class _MyAppDrawerState extends State<MyAppDrawer> {
  int? tapped;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                            "EMP ID  : ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                  ),
                  SizedBox(height: 10,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                          "NAME  : ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
               ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 170),
              child: ListView(
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        tapped=1;
                      });
                      print("Tapped");
                    },
                    child: Container(
                      height: 50,
                      width: width,
                      decoration: BoxDecoration(
                        color: tapped ==1 ? Colors.grey : Colors.transparent,
                      ),
                      child: ListTile(
                        title: Text("DASHBOARD",
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
                        tapped=2;
                      });
                      print("Tapped");
                    },
                    child: Container(
                      height: 50,
                      width: width,
                      decoration: BoxDecoration(
                        color: tapped ==2 ? Colors.grey : Colors.transparent,
                      ),
                      child: ListTile(
                        title: Text("ATTENDANCE STATUS",
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
                    },
                    child: Container(
                      height: 50,
                      width: width,
                      decoration: BoxDecoration(
                        color: tapped ==3 ? Colors.grey : Colors.transparent,
                      ),
                      child: ListTile(
                        title: Text("POSTING",
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
                        tapped=4;
                      });
                      print("Tapped");
                    },
                    child: Container(
                      height: 50,
                      width: width,
                      decoration: BoxDecoration(
                        color: tapped ==4 ? Colors.grey : Colors.transparent,
                      ),
                      child: ListTile(
                        title: Text("LOGOUT",
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
