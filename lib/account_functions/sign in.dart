import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_time_geriatric_health_care_system/account_functions/register.dart';
import 'package:real_time_geriatric_health_care_system/nav%20bar.dart';
import 'package:real_time_geriatric_health_care_system/text_look/text_base.dart';

class Sign_in extends StatefulWidget {
  const Sign_in({Key? key}) : super(key: key);

  @override
  State<Sign_in> createState() => _Sign_inState();
}

class _Sign_inState extends State<Sign_in> {
  bool isPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff213c4f),
        elevation: 0,
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Let's sign you in.",
                    style: T_headlines,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Welcome Back,\nYou've been missed!",
                    style: T_BodyTextd2,
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  MyTextField(
                    Hinttext: "email or username",
                    InputText: TextInputType.text,
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: TextField(
                        obscureText: isPasswordVisible,
                        style: T_BodyTextd.copyWith(color: Colors.black),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            suffixIcon: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: IconButton(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onPressed: () {
                                  setState(() {
                                    isPasswordVisible = !isPasswordVisible;
                                  });
                                },
                                icon: Icon(
                                  isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            contentPadding: EdgeInsets.all(20),
                            hintText: "password",
                            hintStyle: T_BodyTextd,
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.cyan, width: 1),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.cyan, width: 1),
                              borderRadius: BorderRadius.circular(18),
                            )),
                      ))
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  style: T_BodyTextd,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) => register_p()));
                  },
                  child: Text(
                    "Register!",
                    style: T_BodyTextd.copyWith(color: Colors.red),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            MyTextButton(
              bgColor: Colors.cyan,
              ButtonName: 'Sign in',
              OnTap: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => nav_bar()));
              },
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      )),
    );
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField({Key? key, required this.Hinttext, required this.InputText})
      : super(key: key);
  final String Hinttext;
  final TextInputType InputText;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: TextField(
          keyboardType: InputText,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
             contentPadding: EdgeInsets.all(20),
              hintText: Hinttext,
              hintStyle: T_BodyTextd,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.cyan, width: 1),
                borderRadius: BorderRadius.circular(18),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.cyan, width: 1),
                borderRadius: BorderRadius.circular(18),
              )),
        ));
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