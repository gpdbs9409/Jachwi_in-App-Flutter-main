import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:get/get.dart';
import 'package:ja_chuiin/presentation/screens/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NaverMapSdk.instance.initialize(clientId: "g4v4m4nte0");
  runApp(const JaChwuiinApp());
}

class JaChwuiinApp extends StatelessWidget {
  const JaChwuiinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: '자취인',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: SplashScreen(),
    );
  }
}
