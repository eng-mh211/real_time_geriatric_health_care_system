import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:real_time_geriatric_health_care_system/splash/sp.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: FirebaseOptions(apiKey: 'AIzaSyAHKRu3i4gZrdhpKKuNNY33xtTfPF64IWg',
    appId: '1:594899742468:android:e71ca876f93bf949046a51',
    messagingSenderId: '594899742468',
    projectId: 'tetststst-a1360',
    databaseURL: 'https://tetststst-a1360-default-rtdb.firebaseio.com',
    storageBucket: 'tetststst-a1360.appspot.com',));
  runApp(proj());
}
class proj extends StatefulWidget {
  @override
  State<proj> createState() => _projState();
}
class _projState extends State<proj> {
  final FirebaseApp app = Firebase.app();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Colors.white,
          visualDensity:  VisualDensity.adaptivePlatformDensity
      ),
      home:sp()
    );
  }
}