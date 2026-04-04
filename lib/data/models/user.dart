class User {
  final String? nickname;
  final String? id;
  final String? email;
  final String? password;
  final String? name;
  final String? school;

  User({
    this.nickname,
    this.id,
    this.email,
    this.password,
    this.name,
    this.school,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      nickname: json['nickname'],
      id: json['id'],
      email: json['email'],
      password: json['password'],
      name: json['name'],
      school: json['school'],
    );
  }

  Map<String, dynamic> toJson() => {
        'nickname': nickname,
        'id': id,
        'email': email,
      };
}
