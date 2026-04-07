import 'dart:convert';
import 'package:http/http.dart' as http;

class LlmRepository {
  static const String _baseUrl = 'http://3.36.110.85:8080';

  Future<String> recommend({
    required String school,
    required List<String> preferences,
    required double centerX,
    required double centerY,
    double radius = 0.05,
  }) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/api/v1/llm/recommend'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'school': school,
        'preferences': preferences,
        'centerX': centerX,
        'centerY': centerY,
        'radius': radius,
      }),
    );

    if (response.statusCode == 200) {
      return utf8.decode(response.bodyBytes);
    } else {
      throw Exception('추천 요청 실패: ${response.statusCode}');
    }
  }
}
