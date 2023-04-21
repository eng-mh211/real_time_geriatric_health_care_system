import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_time_geriatric_health_care_system/account_functions/register.dart';
import 'account_functions/sign in.dart';

class welcome extends StatefulWidget {
  const welcome({Key? key}) : super(key: key);

  @override
  State<welcome> createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(
        reverse: true,
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Flexible(
                    fit: FlexFit.loose,
                    child: Column(
                      children: [
                        SizedBox(height:8,),
                        Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Image(
                              image: AssetImage('resources/images/welcome_logo.png',),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "Welcome to \nHealth care system",
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Health is an inexhaustible treasure",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: BorderRadius.circular(18)),
                    child: Row(
                      children: [
                        Expanded(
                            child: MyTextButton(
                          bgColor: Color(0xff213c4f),
                          ButtonName: 'Register',
                          OnTap: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => register_p()));
                          },
                        )),
                        Expanded(
                            child: MyTextButton(
                          bgColor: Colors.cyan,
                          ButtonName: 'Sign in',
                          OnTap: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => Sign_in()));
                          },
                        ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ),
        ],
      )),
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
