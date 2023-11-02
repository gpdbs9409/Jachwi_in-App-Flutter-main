import 'package:flutter/material.dart';
import 'package:ja_chuiin/screen/map.dart';
import 'package:ja_chuiin/widgets/postings.dart';
import 'package:ja_chuiin/screen/screen_appbar/mypage.dart';
import 'package:ja_chuiin/screen/screen_appbar/settings.dart';
import 'package:ja_chuiin/widgets/%EB%84%A4%EB%B9%84%EA%B2%8C%EC%9D%B4%EC%85%98%EB%B0%94.dart';

import 'package:ja_chuiin/widgets//comment items.dart';



class vieweachpostings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _vieweachpostingsState();
  }
}

class _vieweachpostingsState extends State<vieweachpostings> {
  @override
  Widget build(BuildContext context) {
    Color myColor = Color.fromARGB(255, 86, 20, 123);
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(


        appBar: AppBar(
        title:Text('자취인'),actions: <Widget>[
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

    body: Container( width:500,
    alignment: Alignment.center,
    color: Colors.white,
      child:Column (

      children:[
      Text(postings[0].title,

      style: TextStyle(
        fontSize: 20
      ),),
      SizedBox(height :deviceHeight*0.01,),
      Text(postings[0].contents),
      Row(  mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon:Icon (Icons.thumb_up_off_alt),
              onPressed: (){ int thumb=0; thumb++;},
            ),
            IconButton(
              icon:Icon (Icons.thumb_up_alt_outlined),
              onPressed:() {},
            ),
            IconButton(
              icon: Icon(Icons.thumb_up_alt_outlined),
              onPressed: (){},
            )
          ]),
Container(
    alignment: Alignment.centerLeft,
    // 왼쪽 정렬을 위한 설정
            child: CommentItem(
              comment: myComments[0],
              isInternal: true,
            ),

        ),
        Container(
          alignment: Alignment.centerLeft,
          // 왼쪽 정렬을 위한 설정
          child: CommentItem(
            comment: myComments[1],
            isInternal: true,
          ),

        )

      /*/ 그니까 comments파일의 메인 위젯을
        이 아이콘 아래에 그냥 배치하고싶은거임 . */


    ]),


    )

    , bottomNavigationBar: BottomAppBar(
      color: myColor,
      child: Row(

        mainAxisAlignment: MainAxisAlignment.center,
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