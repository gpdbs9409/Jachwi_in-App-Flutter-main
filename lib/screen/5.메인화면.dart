
import 'package:flutter/material.dart';
import 'package:ja_chuiin/screen/map.dart';
import 'package:ja_chuiin/screen/screen_appbar/mypage.dart';
import 'package:ja_chuiin/screen/screen_appbar/settings.dart';
import 'package:ja_chuiin/widgets/%EB%84%A4%EB%B9%84%EA%B2%8C%EC%9D%B4%EC%85%98%EB%B0%94.dart';
import 'package:ja_chuiin/widgets/postings.dart';
import 'package:ja_chuiin/screen/6.ViewPosting.dart';



class mainview extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _mainviewState();
  }
}

class _mainviewState extends State<mainview>{
  int _currentIndex = 0;

  @override
  Widget  build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    Color myColor = Color.fromARGB(255, 86, 20, 123);
    return Scaffold(


      appBar: AppBar(
        title:Text('자취인'),
        actions: <Widget>[
        IconButton( // 오른쪽에 위치하는 첫 번째 버튼
          icon: Icon(Icons.search), // 원하는 아이콘으로 변경 가능
          onPressed: () {   Navigator.push(
              context,MaterialPageRoute(builder: (context)=>mypage())
          );
          },
        ),


        IconButton( // 오른쪽에 위치하는 두 번째 버튼
          icon: Icon(Icons.settings), // 원하는 아이콘으로 변경 가능
          onPressed: () {   Navigator.push(
              context,MaterialPageRoute(builder: (context)=>setting())
          );
          },
        ),
      ],
        toolbarHeight: deviceHeight*0.1,
        backgroundColor: myColor, // 앱바의 배경색을 myColor로 설정합니다.
      ),
      body:ListView(

          children:[

            Container(
              height: 0.8*deviceHeight,
        width:0.8*deviceWidth,
        alignment: Alignment.center,
        color: Colors.white,
        child: Container( // 첫 번째 Container의 child로 두 번째 Container를 사용
            width: 300,
            // 스플래시 화면의 배경색을 설정합니다.
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: deviceHeight*0.05),
                TextField(
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10.0),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Color(0xFFD9D9D9), // 텍스트 필드의 배경색을 원하는 색상으로 지정합니다.
                      hintText: '검색어를 입력하세요', // 텍스트 필드 안에 힌트 텍스트를 설정합니다.
                      // 텍스트와 테두리 간의 여백을 조절합니다.
                      prefixIcon: Icon(Icons.search) ),

                ),
                SizedBox(height: deviceHeight*0.05),

                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 80,
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Color(0xFFD9D9D9)),
                          ),
                          child: Text(
                            '공동구매',
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => RankingScreen()),
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
                            backgroundColor: MaterialStateProperty.all(Color(0xFFD9D9D9)),
                          ),
                          child: Text(
                            '룸메이트',
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => RankingScreen()),
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
                            backgroundColor: MaterialStateProperty.all(Color(0xFFD9D9D9)),
                          ),
                          child: Text(
                            '방구해요',
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => RankingScreen()),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: deviceHeight*0.05),

                Container(
                    height:400,
                    alignment: Alignment.center,
                    color:Color(0xFFD9D9D9),

                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: postings.length,// 리스트에 보여질 아이템의 총 개수
                      itemBuilder: (BuildContext context, int index) {
                        // index에 해당하는 아이템을 생성하여 반환합니다.
                        return ListTile
                          (leading:CircleAvatar(
                          radius: 10,
                          backgroundImage:(postings[index].image.image),
                        ),
                          title: Text(postings[index].title),
                          subtitle: Text(postings[index].contents.substring(0,10)),
                          onTap: () {   Navigator.push(
                              context,MaterialPageRoute(builder: (context)=>vieweachpostings())
                          );
                          },);


                      },


                    ))



              ],)
        ),
      )]),


      bottomNavigationBar: BottomAppBar(
        height: 0.1*deviceHeight,
        color: myColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NavItem(
              icon: Icons.stars,
              destination: RankingScreen(),
            ),
            NavItem(
              icon: Icons.message,
              destination: MessageScreen(),
            ),
            NavItem(
              icon: Icons.home,
              destination: HomeScreen(),
            ),
            NavItem(
              icon: Icons.map,
              destination: MyMAP(),
            ),
            NavItem(
              icon: Icons.notifications,
              destination: NotificationScreen(),
            ),
          ],
        ),
      ),
//다섯개 아이콘 , 이동위치를 클래스로 짠다음에 일일이 안쓰고 for문처럼 돌리고싶은데 이건 나중에

    );

  }
}