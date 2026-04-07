import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ja_chuiin/data/models/map_bounds.dart';

class MapRepository {
  static const String _baseUrl = 'http://3.36.110.85:8080';

  // GET /api/v1/map/view/position?minX=&maxX=&minY=&maxY=
  // MapBounds: southLatitude=minY, northLatitude=maxY, westLongitude=minX, eastLongitude=maxX
  Future<List<dynamic>> fetchBuildingsInArea(MapBounds bounds) async {
    final uri = Uri.parse('$_baseUrl/api/v1/map/view/position').replace(
      queryParameters: {
        'minX': bounds.westLongitude.toString(),
        'maxX': bounds.eastLongitude.toString(),
        'minY': bounds.southLatitude.toString(),
        'maxY': bounds.northLatitude.toString(),
      },
    );

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return json.decode(response.body) as List<dynamic>;
    } else {
      throw Exception('건물 데이터 조회 실패: ${response.statusCode}');
    }
  }
}
