class User {
  final String? nickname;
  final String? id;
  final String? email;
  final String? password;
  final String? name;
  final String? school;

  User({
    required this.nickname,
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.school,
  });

  factory User.fromJson(Map<String, dynamic> json) {
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
        'nickname': nickname,
        'id': id,
        'email': email,
      };
}
