import 'package:flutter/material.dart';

class h1 extends StatefulWidget {
  const h1({Key? key}) : super(key: key);

  @override
  State<h1> createState() => _h1State();
}

class _h1State extends State<h1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        child: Column(
          children: [
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image: DecorationImage(
                                image:
                                AssetImage("resources/images/stan lee.jpg"))),
                      ),
                      SizedBox(width: 10,),
                      Text("Mr.Stan lee"),
                    ],
                  ),
                ),

              ],
            ))
          ],
        ),
      )),
    );
  }
}
