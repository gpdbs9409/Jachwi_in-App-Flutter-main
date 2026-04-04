import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthRepository {
  static const String _baseUrl = 'http://localhost:8081';

  // POST /auth/login — {email, password} → {accessToken, refreshToken}
  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email, 'password': password}),
    );

    if (response.statusCode != 200) {
      throw Exception('로그인 실패: ${response.statusCode}');
    }
    return json.decode(response.body) as Map<String, dynamic>;
  }

  // GET /auth/join/mailConfirm/{email} — 이메일 중복확인 + 인증코드 발송
  Future<void> sendVerificationEmail(String email) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/auth/join/mailConfirm/$email'),
    );

    if (response.statusCode != 200) {
      throw Exception('인증 이메일 전송 실패: ${response.statusCode}');
    }
  }

  // POST /auth/join/mailConfirm — {email, ePw} → 인증코드 검증
  Future<void> verifyEmailCode(String email, String code) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/auth/join/mailConfirm'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email, 'ePw': code}),
    );

    if (response.statusCode != 200) {
      throw Exception('인증 실패: ${response.statusCode}');
    }
  }

  // POST /auth/join — {email, name, nickname, password, school}
  Future<void> registerUser(Map<String, dynamic> userInfo) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/auth/join'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(userInfo),
    );

    if (response.statusCode != 200) {
      throw Exception('회원가입 실패: ${response.statusCode}');
    }
  }
}
