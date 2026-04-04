import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ja_chuiin/data/models/map_bounds.dart';

class MapRepository {
  static const String _baseUrl = 'http://localhost:8080';

  Future<void> sendMapBounds(MapBounds bounds) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/map/bounds'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(bounds.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('지도 범위 전송 실패: ${response.statusCode}');
    }
  }

  Future<int> fetchMarkerCount() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/map/markers'),
    );

    if (response.statusCode == 200) {
      return int.parse(json.decode(response.body));
    } else {
      throw Exception('마커 데이터 조회 실패: ${response.statusCode}');
    }
  }
}
