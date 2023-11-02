/*import 'package:flutter/material.dart';

//route는 화면 전환을 편하게 하기 위해서 위젯에 별명을 붙이는것.  (=단축어)
// 책p.342참고하기

class Routes extends StatelessWidget{
@override

  WidgetBuilder(BuildContext context){//아니 .. 빌드는 화면구성하는 위젯이니까 굳이 빌드 안넣어도 될거같은데 . 니가 하고싶은건 화면 구성이잖아
  return MaterialApp(
  initialRoute:'/',
  routes:{
  '/':(context)=>main(),
  'mypage':(context)=>mypage(),
  'set':(context)=>setting()});
}}



// 사용법 : Navigator.pushNamed(context,'/'); d원래 지금까지의 코드에 작성된 Navigator.push () 보다 훨씬 짧아지니 이걸로 다 변경할것.*/
