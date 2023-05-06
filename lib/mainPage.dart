import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class main_page extends StatefulWidget {
  const main_page({Key? key}) : super(key: key);

  @override
  State<main_page> createState() => _main_pageState();
}

class _main_pageState extends State<main_page> {
  late DatabaseReference _TempRef;
  late DatabaseReference _Spo2Ref;
  late DatabaseReference _BPMRef;
  num _Spo2 = 0;
  num _BPM = 0;
  double _Temp = 0;
  @override
  void initState() {
    super.initState();

    // Get a reference to the Firebase Realtime Database.
    _TempRef = FirebaseDatabase.instance.ref('Temperature');
    _BPMRef = FirebaseDatabase.instance.ref('BPM');
    _Spo2Ref = FirebaseDatabase.instance.ref('Spo2');
    // Attach a listener to the database reference to update the UI when the data changes.
    _TempRef.onValue.listen((event) {
      setState(() {
        _Temp = event.snapshot.value as double;
      });
    });

    _BPMRef.onValue.listen((event) {
      setState(() {
        _BPM = event.snapshot.value as num;
      });
    });

    _Spo2Ref.onValue.listen((event) {
      setState(() {
        _Spo2 = event.snapshot.value as num;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          automaticallyImplyLeading: false,
          title: Align(
            alignment: Alignment.center,
            child: Text(
              "Patient Stats",
            ),
          )),
      body: Center(
          child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SPO2 LEVEL
                Container(
                    height: 200,
                    width: 180,
                    child: SfRadialGauge(axes: <RadialAxis>[
                      RadialAxis(minimum: 0, maximum: 100, ranges: <GaugeRange>[
                        GaugeRange(
                            startValue: 0, endValue: 70, color: Colors.red),
                        GaugeRange(
                            startValue: 70, endValue: 90, color: Colors.orange),
                        GaugeRange(
                            startValue: 90, endValue: 100, color: Colors.green)
                      ], pointers: <GaugePointer>[
                        NeedlePointer(value: _Spo2.toDouble())
                      ], annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                            widget: Container(
                                child: Align(
                              alignment: Alignment.center,
                              child: Text("$_Spo2\nSPO-2",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)),
                            )),
                            angle: 90,
                            positionFactor: 0.5)
                      ]),
                    ])),

                Container(
                    height: 200,
                    width: 180,
                    child: SfRadialGauge(axes: <RadialAxis>[
                      RadialAxis(minimum: 0, maximum: 150, ranges: <GaugeRange>[
                        GaugeRange(
                            startValue: 0, endValue: 60, color: Colors.red),
                        GaugeRange(
                            startValue: 60, endValue: 80, color: Colors.orange),
                        GaugeRange(
                            startValue: 80, endValue: 150, color: Colors.green)
                      ], pointers: <GaugePointer>[
                        NeedlePointer(value: _BPM.toDouble())
                      ], annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                            widget: Container(
                                child: Align(
                              alignment: Alignment.center,
                              child: Text("$_BPM\nBPM",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)),
                            )),
                            angle: 90,
                            positionFactor: 0.5)
                      ]),
                    ])),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            // Temputure level
            Container(
                width: 300,
                child: Column(
                  children: [
                    SfLinearGauge(
                      ranges: [
                        LinearGaugeRange(
                          startValue: 0,
                          endValue: _Temp,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Temputure : $_Temp",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )
                  ],
                ))
          ],
        ),
      )),
    );
  }
}