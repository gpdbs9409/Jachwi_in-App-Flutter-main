import 'package:flutter/material.dart';

class UserInform {
  String id;
  String email;
  String password;
  String name;
  String nickname;
  String school;
  Image MyImage;

  UserInform({
    required this.id,

    required this.email,
    required this.password,
    required this.name,
    required this.nickname,
    required this.school,
    required this.MyImage,
  });
}
List<UserInform> UserInforms = [
  UserInform(
 id:"A",
 email:"A",
 password:"A",
 name:"A",
 nickname:"A",
 school:"A",
MyImage:Image.asset(
'assets/images/my_logo.png',
   )

  ),

];