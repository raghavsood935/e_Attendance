import 'package:flutter/material.dart';

import 'buttons.dart';

void LogoutBottomSheet(BuildContext context){
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 40,
            color: Colors.transparent,
            child: Center(
              child: IconButton(
                iconSize: 30,
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.cancel_outlined,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
          height: 200,
            child: Container(
              color: Colors.white,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 15),
                      Text(
                          'LOGOUT',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      Spacer(),
                      Text(
                          'Are You Sure You Want To Logout?',
                        style: TextStyle(
                          fontSize: 16
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 140,
                              height: 40,
                              child: Button(
                                onPressed: (){},
                                title: "YES",
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                              width: 140,
                              height: 40,
                              child: Button(
                                onPressed: (){},
                                title: "NO",
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
            ),
        ),
      ],
      );
    },
  );
}

