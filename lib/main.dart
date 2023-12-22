import 'package:flutter/material.dart';
import 'package:ja_chuiin/screen/0.splash screen.dart';
import 'package:ja_chuiin/screen//2.authorizon.dart';
import 'package:ja_chuiin/screen//3.agreement.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';


import 'package:ja_chuiin/screen/1.log_in.dart'; // json할떄사용하는

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NaverMapSdk.instance.initialize(clientId: "g4v4m4nte0");
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      routes: {
        '0': (context) => SplashScreen(),
        '1': (context) => LOGIN(),
        '2': (context) => authorization(),
        '3': (context) => Agreements()
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: SplashScreen(),
    );
  }
}
