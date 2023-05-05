import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:real_time_geriatric_health_care_system/text_look/text_base.dart';
import 'data/data.dart';

class Home extends StatefulWidget {
  const Home({Key? key,required this.app}) : super(key: key);
  final FirebaseApp app;
  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  final referenceDatase = FirebaseDatabase.instance;
  bool status7=false;
  late final DatabaseReference _counterRef;
  @override
   void initState() {
     final FirebaseDatabase database = FirebaseDatabase.instanceFor(app: widget.app);
       _counterRef = database.ref('BPM');
        super.initState();
    }
  @override
  Widget build(BuildContext context) {
    final ref = referenceDatase.ref();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body:SafeArea(
        child: Column(
          children: [
            Flexible(child: FirebaseAnimatedList(query: _counterRef,
                shrinkWrap: true,
                itemBuilder: (BuildContext context,DataSnapshot snapshot, Animation<dynamic>animation,
            dynamic index)
                {
                  var m = snapshot.value.toString();
                      return Text(m,style: T_BodyTextd,);
                }
            )
            ),
          ],
        ),
      )
    );
  }

}


