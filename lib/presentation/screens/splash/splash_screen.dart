import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ja_chuiin/core/constants/size_config.dart';
import 'package:flutter/foundation.dart';
import 'package:ja_chuiin/presentation/screens/home/home_screen.dart';
import 'package:ja_chuiin/presentation/screens/map/map_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (kIsWeb) {
        Get.off(() => HomeScreen());
      } else {
        Get.off(() => MapScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/my_logo.png',
          width: SizeConfig.deviceWidth * 0.3,
        ),
      ),
    );
  }
}
