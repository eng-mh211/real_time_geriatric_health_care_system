import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_database/ui/firebase_list.dart';
import 'package:flutter/material.dart';
import 'package:real_time_geriatric_health_care_system/text_look/text_base.dart';
import 'package:at_gauges/at_gauges.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  FirebaseDatabase database = FirebaseDatabase.instance;

   Widget listItem({required Map da}) {
     return Container(
       margin: const EdgeInsets.all(10),
       padding: const EdgeInsets.all(10),
       height: 110,
       color: Colors.amberAccent,
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Text(
             da['Temperature'],
             style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
           ),
         ],
       ),
     );
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

            ],
          ),
        ),
      ),
    );
  }
}
class box extends StatelessWidget {
  const box({Key? key, this.values}) : super(key: key);
  final values;
  @override
  Widget build(BuildContext context) {
    return ScaleRadialGauge(
      maxValue: 150,
      actualValue: values,
      size: 250,
      titlePosition: TitlePosition.bottom,
      title: Text("Temp"),
      minValue: 0,
      needleColor: Colors.red,
    );
  }
}
