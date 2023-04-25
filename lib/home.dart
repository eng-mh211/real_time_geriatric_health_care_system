import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_database/ui/firebase_list.dart';
import 'package:flutter/material.dart';
import 'package:real_time_geriatric_health_care_system/text_look/text_base.dart';
import 'package:at_gauges/at_gauges.dart';

import 'data/data.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  DatabaseReference dbRef = FirebaseDatabase.instance.ref();

  final TextEditingController _edtTmpController = TextEditingController();

  List<info> nodedatalist =[];
  @override
  void initState() {
    super.initState();

    retrieveNodeData();
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
              for (int i = 0;i < nodedatalist.length;i++ )
              temp(nodedatalist[i])
            ],
          ),
        ),
      ),
    );
  }
  void retrieveNodeData() {
    dbRef.child("Temperature").onChildAdded.listen((data) {
      NodeData nodeData = NodeData.fromJson(data.snapshot.value as Map);
      info user = info(key: data.snapshot.key, nodeData: nodeData);
      nodedatalist.add(user);
      setState(() {});
    });

  }

  Widget temp(info nodedatalist){
    return Container(
      child:Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(nodedatalist.nodeData!.Temperature!)
            ],
          )
        ],
      ),
    );
  }
}


