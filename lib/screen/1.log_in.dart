import 'package:flutter/material.dart';
import 'package:ja_chuiin/Functions/ToBackend.dart';
import 'package:ja_chuiin/Functions/FromBackEnd.dart';
import 'package:ja_chuiin/utilities/Colors.dart';
import 'package:ja_chuiin/widgets/BottomAppBar.dart';
import 'package:ja_chuiin/utilities/SizeConfig.dart';


class LOGIN extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LOGINState();
  }
}

class _LOGINState extends State<LOGIN> {


  @override
  Widget build(BuildContext context) {
    TextEditingController _idController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    @override
    void dispose() {
      _idController.dispose();
      _passwordController.dispose();
      super.dispose();
    } // 메모리 누수 막으려는 코드 (할당해제 )

    return Scaffold(
        body: Container(
            padding: EdgeInsets.all(SizeConfig.deviceWidth * 0.1),
            margin: EdgeInsets.all(SizeConfig.deviceWidth * 0.05),
            // 원하는 만큼 padding 값을 지정합니다.
            alignment: Alignment.center,
            color: Colors.white,
            child: Column(
              children: [
                Image.asset('assets/images/my_logo.png',
                    width: SizeConfig.deviceWidth * 0.25),
                Container(
                  width: SizeConfig.deviceWidth * 0.25,
                  child: Column(
                    children: [
                      TextField(
                          controller: _idController,
                          style: TextStyle(fontSize: 15),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Color(0xFFD9D9D9),
                            // 텍스트 필드의 배경색을 원하는 색상으로 지정합니다.
                            hintText: '아이디',
                            // 텍스트 필드 안에 힌트 텍스트를 설정합니다.
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10.0), // 텍스트와 테두리 간의 여백을 조절합니다.
                          )),

                      SizedBox(height: 16),
                      TextField(
                        controller: _passwordController,
                        style: TextStyle(fontSize: 15),
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Color(0xFFD9D9D9),
                          // 텍스트 필드의 배경색을 원하는 색상으로 지정합니다.
                          hintText: '비밀번호',
                          // 텍스트 필드 안에 힌트 텍스트를 설정합니다.
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10.0), // 텍스트와 테두리 간의 여백을 조절합니다.
                        ),
                      ),
                      SizedBox(height: 16), // 로고와 텍스트 사이의 간격을 설정합니다.
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xFFDFACEC) //
                        ),
                        child: Text('로그인'),
                        onPressed: () {
                          String id = _idController.text;
                          String password = _passwordController.text;
                          sendDataToBackend(id, password);
                          Navigator.pushNamed(context, '2');
                        },
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(Colors.white)),
                        child: Text(
                          '회원가입',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '3');
                        },
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(Colors.white)),
                        child: Text(
                          'PW찾기',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '3');
                        },
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(Colors.white)),
                        child: Text(
                          'ID찾기',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '3');
                        },
                      ),
                    )
                  ],
                )
              ],
            )));
  }
}
