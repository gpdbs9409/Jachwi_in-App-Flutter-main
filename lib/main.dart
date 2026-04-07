import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ja_chuiin/presentation/screens/splash/splash_screen.dart';
import 'package:ja_chuiin/utils/naver_map.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    await NaverMapSdk.instance.initialize(clientId: "g4v4m4nte0");
  }
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
