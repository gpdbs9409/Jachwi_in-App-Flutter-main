import 'package:flutter/material.dart';
import 'package:ja_chuiin/models/postings.dart';
import 'package:ja_chuiin/screen/map.dart';
import 'package:ja_chuiin/widgets/BottomAppBar.dart';
import 'package:ja_chuiin/screen/6.ViewPosting.dart';
import 'package:ja_chuiin/widgets/Appbar.dart';


class mainview extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _mainviewState();
  }
}

class _mainviewState extends State<mainview> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery
        .of(context)
        .size
        .width;
    double deviceHeight = MediaQuery
        .of(context)
        .size
        .height;
    Color myColor = Color.fromARGB(255, 86, 20, 123);
    return Scaffold(
        appBar: Appbar(),
        body: ListView(children: [
          Container(
            height: 0.8 * deviceHeight,
            width: 0.8 * deviceWidth,
            alignment: Alignment.center,
            color: Colors.white,
            child: Container(
              // 첫 번째 Container의 child로 두 번째 Container를 사용
                width: 300,
                // 스플래시 화면의 배경색을 설정합니다.
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: deviceHeight * 0.05),
                    TextField(
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10.0),
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Color(0xFFD9D9D9),
                          // 텍스트 필드의 배경색을 원하는 색상으로 지정합니다.
                          hintText: '검색어를 입력하세요',
                          // 텍스트 필드 안에 힌트 텍스트를 설정합니다.
                          // 텍스트와 테두리 간의 여백을 조절합니다.
                          prefixIcon: Icon(Icons.search)),
                    ),
                    SizedBox(height: deviceHeight * 0.05),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 80,
                            child: TextButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xFFD9D9D9)),
                              ),
                              child: Text(
                                '공동구매',
                                style: TextStyle(color: Colors.black),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                    builder: (context)
                                =>
                                    MyMAP()
                                ,
                                ));
                              },
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Container(
                            height: 80,
                            child: TextButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xFFD9D9D9)),
                              ),
                              child: Text(
                                '룸메이트',
                                style: TextStyle(color: Colors.black),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyMAP()),
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Container(
                            height: 80,
                            child: TextButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xFFD9D9D9)),
                              ),
                              child: Text(
                                '방구해요',
                                style: TextStyle(color: Colors.black),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyMAP()),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: deviceHeight * 0.05),
                    Container(
                        height: 400,
                        alignment: Alignment.center,
                        color: Color(0xFFD9D9D9),
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: postings.length, // 리스트에 보여질 아이템의 총 개수
                          itemBuilder: (BuildContext context, int index) {
                            // index에 해당하는 아이템을 생성하여 반환합니다.
                            return ListTile(
                              leading: CircleAvatar(
                                radius: 10,
                                backgroundImage: (postings[index].image.image),
                              ),
                              title: Text(postings[index].title),
                              subtitle: Text(
                                  postings[index].contents.substring(0, 10)),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            vieweachpostings()));
                              },
                            );
                          },
                        ))
                  ],
                )),
          )
        ]),
        bottomNavigationBar: Bottom());
  }
}
