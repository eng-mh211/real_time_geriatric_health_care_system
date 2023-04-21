import 'package:flutter/material.dart';

import '../text_look/text_base.dart';

class register_p extends StatefulWidget {
  const register_p({Key? key}) : super(key: key);
  @override
  State<register_p> createState() => _register_pState();
}

class _register_pState extends State<register_p> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff213c4f),
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width * 0.8,
            ),
            Image.asset("resources/images/coming soon.jpg"),
            Text("Coming Soon\nStay tuned",style: T_BodyTextd2,textAlign: TextAlign.center,)
          ],
        ),
      ),
    );
  }
}

class MyTextButton extends StatelessWidget {
  const MyTextButton({
    Key? key,
    required this.ButtonName,
    required this.OnTap,
    required this.bgColor,
  }) : super(key: key);
  final String ButtonName;
  final Function OnTap;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(18)),
      child: TextButton(
        style: ButtonStyle(
            overlayColor:
                MaterialStateColor.resolveWith((states) => Colors.black12)),
        child: Text(
          ButtonName,
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () => OnTap(),
      ),
    );
  }
}
