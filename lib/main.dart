import 'package:flutter/material.dart';
import 'package:real_time_geriatric_health_care_system/splash/sp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'nav bar.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const proj());
}

class proj extends StatelessWidget {
  const proj({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Colors.white,
          visualDensity:  VisualDensity.adaptivePlatformDensity
    ),
      home:sp(),
    );
  }
}
