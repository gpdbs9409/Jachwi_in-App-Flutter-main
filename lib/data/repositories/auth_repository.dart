import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthRepository {
  static const String _baseUrl = 'http://BACKEND_IP:BACKEND_PORT';

  Future<void> login(String id, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'id': id, 'password': password}),
    );

    if (response.statusCode != 200) {
      throw Exception('로그인 실패: ${response.statusCode}');
    }
  }

  Future<void> sendVerificationEmail(String email) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/auth/verify/send'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email}),
    );

    if (response.statusCode != 200) {
      throw Exception('인증 이메일 전송 실패: ${response.statusCode}');
    }
  }

  Future<void> registerUser(Map<String, dynamic> userInfo) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/auth/register'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(userInfo),
    );

    if (response.statusCode != 200) {
      throw Exception('회원가입 실패: ${response.statusCode}');
    }
  }
}
