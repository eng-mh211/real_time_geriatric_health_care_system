import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../welcome_page.dart';

class sp extends StatefulWidget {
  const sp({Key? key}) : super(key: key);

  @override
  State<sp> createState() => _spState();
}

class _spState extends State<sp> {
  Future Delay() async {
    await new Future.delayed(Duration(seconds: 5));
    Navigator.push(context, MaterialPageRoute(builder: (context) => welcome()));
  }

  @override
  void initState() {
    super.initState();
    Delay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "resources/images/img.png",
              height: 200,
              width: 200,
            ),
            SizedBox(
              height: 60,
            ),
            SpinKitChasingDots(
              size: 40,
              color: Color(0XFF00c8dd),
            )
          ],
        ),
      ),
    );
  }
}
