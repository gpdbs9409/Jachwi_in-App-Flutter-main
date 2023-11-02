import 'package:flutter/material.dart';
import 'dart:core' ;
import 'package:ja_chuiin/widgets/UserInformation.dart';
import 'package:ja_chuiin/screen/5.메인화면.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


Color myColor = Color.fromARGB(255, 86,20,123);

class getuserinform extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _getuserinformState();
  }
}

class _getuserinformState extends State<getuserinform>{

  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    TextEditingController name = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController nickname = TextEditingController();
    TextEditingController school = TextEditingController();
    return Scaffold(

        appBar: AppBar(
          title: Text('회원정보작성'
          ),
          backgroundColor: myColor, // 앱바의 배경색을 myColor로 설정합니다.
        ),
        body: Padding(
          padding: EdgeInsets.all( deviceWidth*0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:[  Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                margin: EdgeInsets.only(bottom: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xFFD9D9D9),
                ),
                child: Row(
                  children: [

                    SizedBox(width: 10.0),
                    Expanded(
                      child: TextField(
                        controller: name,
                        decoration: InputDecoration(
                          hintText: "아이디",// Renamed from "hintText" to "whatinform"
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              )]
            ))


,
        bottomNavigationBar: BottomAppBar(
          color: myColor,
          child: Container(

            child:
            ElevatedButton(
              style: ElevatedButton.styleFrom(

              primary:Color(0xFF56147B) ),

                onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(

                      content: Text('환영합니다'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // 팝업 닫기
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => mainview(), // authorization 위젯으로 화면 전환
                              ),
                            );
                          },
                          child: Text('자취인시작하기'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('작성했어요'),
            ),


            height: 50.0, // 하단바의 높이를 조정합니다.
          ),
        )
    );
  }
}
