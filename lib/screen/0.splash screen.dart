import 'package:flutter/material.dart';
import 'package:ja_chuiin/screen/1.log_in.dart';
import 'package:ja_chuiin/screen/map.dart';

class SplashScreen extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();

}


class _MyWidgetState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin(); // initState에서 _navigateToLogin 함수 호출
  }

  // 로그인 화면으로 이동하는 함수
  void _navigateToLogin() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushNamed(context, '1'); // 3초있다가 자동으로 로그인 화면으로 이동

    });
  }
  @override
  Widget  build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
  Color myColor = Color.fromARGB(255, 86, 20, 123);
  return Scaffold(


  body: Container(
  alignment: Alignment.center,
  color: Colors.white, // 스플래시 화면의 배경색을 설정합니다.
  child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
  Image.asset(
  'assets/images/my_logo.png',
  width: deviceWidth*0.3,

  ),
  ],
  ),
  ),
  );
  }
  }
