import 'package:ja_chuiin/models/user_model.dart';

class comments {
  final String name;
  final String comment;
  final String date;
  final String time;


  comments({
    required this.name,
    required this.comment,
    required this.date,
    required this.time,
  });

   User fromJson(Map<String, dynamic> json) {
    return User(
      nickname: json['nickname'],
      id: json['id'],
      email: json['email'],
      password: json['nickname'],
      name: json['major'],
      school: json['gender'],
    );
  }


  Map<String, dynamic> toJson() => {
    'name': name,
    'comment': comment,
    'date': date,
  };

}




