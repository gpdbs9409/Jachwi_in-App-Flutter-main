import 'package:flutter/material.dart';
import 'package:ja_chuiin/screen/4.인적사항.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class authorization extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _authorizationState();
  }
}

class _authorizationState extends State<authorization> {
  TextEditingController _EmailController = TextEditingController();
  TextEditingController _CodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Color myColor = Color.fromARGB(255, 86, 20, 123);
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '본인인증',
            textAlign: TextAlign.center,
          ),
          backgroundColor: myColor, // 앱바의 배경색을 myColor로 설정합니다.
        ),
        body: Container(
            height: deviceHeight,
            alignment: Alignment.center,
            color: Colors.white,
            child: Column(children: [
              Image.asset(
                'assets/images/my_logo.png',
                width: 150,
                height: 150,
              ),
              Container(
                width: deviceWidth * 0.3,
                child: Column(
                  children: [
                    Text(
                      ' 이메일을 ',
                      textAlign: TextAlign.center,
                    ),

                    Text(
                      '입력해주세요 ',
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: deviceHeight * 0.03),

                    TextField(
                      controller: _EmailController,
                      style: TextStyle(fontSize: 15),
                      obscureText: true,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Color(0xFFD9D9D9),
                        // 텍스트 필드의 배경색을 원하는 색상으로 지정합니다.
                        hintText: '이메일',
                        // 텍스트 필드 안에 힌트 텍스트를 설정합니다.
                        contentPadding: EdgeInsets.symmetric(
                            horizontal:
                                deviceHeight * 0.05), // 텍스트와 테두리 간의 여백을 조절합니다.
                      ),
                    ),
                    SizedBox(height: deviceHeight * 0.03),

                    ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: Color(0xFFDFACEC) //
                              ),
                      child: Text('인증번호 전송 '),
                      onPressed: () {
                        String email = _EmailController.text;
                        _sendDataToBackend(email);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => getuserinform()));
                      },
                    ),
                    SizedBox(height: deviceHeight * 0.03),

                    Text('인증번호'), SizedBox(height: 16),

                    TextField(
                      controller: _CodeController,
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        filled: true,
                        border: InputBorder.none,
                        fillColor: Color(0xFFD9D9D9),
                        // 텍스트 필드의 배경색을 원하는 색상으로 지정합니다.
                        hintText: '성함',
                        // 텍스트 필드 안에 힌트 텍스트를 설정합니다.
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 10.0), // 텍스트와 테두리 간의 여백을 조절합니다.
                      ),
                    ),
                    SizedBox(height: deviceHeight * 0.03),

                    // 로고와 텍스트 사이의 간격을 설정합니다.
                    ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: Color(0xFFDFACEC) //
                              ),
                      child: Text('인증완료'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => getuserinform()));
                      },
                    ),
                  ],
                ),
              ),
            ])),
        bottomNavigationBar: BottomAppBar(
          color: myColor,
          child: Container(
            height: 50.0, // 하단바의 높이를 조정합니다.
          ),
        ));
  }

  Future<void> _sendDataToBackend(String email) async {
    final url =
        Uri.parse('http://BACKEND_IP:BACKEND_PORT'); // 여기에 백엔드의 URL을 입력해야 합니다.
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email}),
    );

    if (response.statusCode == 200) {
      print('Data sent successfully to the backend.');
      // 백엔드로 데이터가 성공적으로 보내졌을 경우 수행할 작업을 추가할 수 있습니다.
    } else {
      print('Failed to send data to the backend.');
      // 백엔드로 데이터를 보내는 데 실패한 경우 수행할 작업을 추가할 수 있습니다.
    }
  }
}
