import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:real_time_geriatric_health_care_system/home.dart';
import 'package:real_time_geriatric_health_care_system/test.dart';
import 'p1.dart';


class nav_bar extends StatefulWidget {
  const nav_bar({Key? key}) : super(key: key);

  @override
  State<nav_bar> createState() => _nav_barState();
}

class _nav_barState extends State<nav_bar> {
  static List<Widget> op = <Widget>[
    Home(),
    news(),
    h1(),
    h1(),
  ];
  @override
  int S_index = 0;
 final items =<Widget>[
   Icon(Icons.home, size: 30),
   Icon(Icons.newspaper, size: 30),
   Icon(Icons.support_agent, size: 30),
   Icon(Icons.perm_identity, size: 30),
 ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff4587fa),
        bottomNavigationBar: CurvedNavigationBar(
          height: 50,
          items: items,
          index: S_index,
          color: Colors.white,
          buttonBackgroundColor: Colors.grey.shade300,
          backgroundColor: Colors.blueGrey,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 300),
          letIndexChange: (index) => true,
          onTap:(index){
            setState(() {
              S_index =index;
            });
          },
        ),
      body: Center(
        child: op.elementAt(S_index),
      ),
  );
  }
}

