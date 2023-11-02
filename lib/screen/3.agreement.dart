import 'package:flutter/material.dart';
import 'dart:core' ;
import 'package:ja_chuiin/screen/2.authorizon.dart';


Color myColor = Color.fromARGB(255, 86,20,123);
class agreements{
  String title;
  String contents;
  bool isChecked = false;
  agreements(this.title,this.contents,this.isChecked);
}


class Agreements extends StatefulWidget {
  @override
  _AgreementsState createState() => _AgreementsState();
}

class _AgreementsState extends State<Agreements> {
  bool isChecked = false;
  TextEditingController textEditingController = TextEditingController();
  List<agreements> users =[
   agreements('약관1','content',true),
    agreements('약관1','content',true),
    agreements('약관1','content',true),
  ];
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    bool allChecked = users.every((user) => user.isChecked);
    return Scaffold(

      appBar: AppBar(
        title: Text('회원가입'
        ),
        backgroundColor: myColor, // 앱바의 배경색을 myColor로 설정합니다.
      ),

      body:ListView.separated(
        itemCount: users.length,
        itemBuilder: (context, index){
          return ListTile(
            leading: Checkbox(
          value: users[index].isChecked,
          onChanged: (value) {
          setState(() {
          users[index].isChecked = value ?? false;
          });},
            ),
            title: Text(users[index].title),
            subtitle: Text(users[index].contents),
            trailing: Icon(Icons.more_vert),
            onTap: (){
              print(users[index].title);
            },
          );
        },
        separatorBuilder: (context, index){
          return Divider(height: 2, color: Colors.black,);
        },
      ),
        bottomNavigationBar: BottomAppBar(
          color: myColor,
          child: Container(

            child:
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary:myColor //
              ),
              child: Text('다음'),
              onPressed: allChecked ? () {

                Navigator.push(
                    context,MaterialPageRoute(builder: (context)=>authorization())
                );
              }:null,
            ),

            height: 50.0, // 하단바의 높이를 조정합니다.
          ),
        )
    );
  }
}
