import 'package:flutter/material.dart';
import 'package:ja_chuiin/screen/mypage.dart';
import 'package:ja_chuiin/screen/settings.dart';
import 'package:ja_chuiin/utilities/Colors.dart';
import 'package:ja_chuiin/utilities/SizeConfig.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  const Appbar({super.key});
  Size get preferredSize => Size.fromHeight(SizeConfig.deviceHeight * 0.1); // 이 부분이 추가되어야 합니다.

  @override
  Widget build(BuildContext context) {
    return AppBar(
    toolbarHeight: SizeConfig.deviceHeight * 0.1,
    backgroundColor: myColor ,// 앱바의 배경색을 myColor로 설정합니다.
    title: Text('자취인') ,
    actions:
    <Widget>[
    IconButton(
// 오른쪽에 위치하는 첫 번째 버튼
    icon: Icon(Icons.search), // 원하는 아이콘으로 변경 가능
    onPressed: () {
    Navigator.push(
    context, MaterialPageRoute(builder: (context) => mypage()));
    },
    ),
    IconButton(
// 오른쪽에 위치하는 두 번째 버튼
    icon: Icon(Icons.settings), // 원하는 아이콘으로 변경 가능
    onPressed: () {
    Navigator.push(context,
    MaterialPageRoute(builder: (context) => setting()));
    },
    ),
    ]
    ) ;

  }
}

