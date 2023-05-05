
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:real_time_geriatric_health_care_system/test.dart';
import 'mainPage.dart';
import 'p1.dart';


class nav_bar extends StatefulWidget {


  @override
  State<nav_bar> createState() => _nav_barState();
}

class _nav_barState extends State<nav_bar> {

  static List<Widget> op = <Widget>[
    const main_page(),
    const news(),
    const h1(),
    const h1(),
  ];
  @override
  int S_index = 0;
 final items =<Widget>[
   const Icon(Icons.home, size: 30),
   const Icon(Icons.newspaper, size: 30),
   const Icon(Icons.support_agent, size: 30),
   const Icon(Icons.perm_identity, size: 30),
 ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff4587fa),
        bottomNavigationBar: CurvedNavigationBar(
          height: 50,
          items: items,
          index: S_index,
          color: Colors.white,
          buttonBackgroundColor: Colors.grey.shade300,
          backgroundColor: Colors.blueGrey,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 300),
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

