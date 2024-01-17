import 'package:http/http.dart' as http;
import 'dart:convert';


Future<void> sendDataToBackend(String id, String password) async {
  final url =
  Uri.parse('http://BACKEND_IP:BACKEND_PORT'); // 여기에 백엔드의 URL을 입력해야 합니다.

  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: json.encode({'id': id, 'password': password}),
  );

  if (response.statusCode == 200) {
    print('Data sent successfully to the backend.');
    // 백엔드로 데이터가 성공적으로 보내졌을 경우 수행할 작업을 추가할 수 있습니다.
  } else {
    print('Failed to send data to the backend.');
    // 백엔드로 데이터를 보내는 데 실패한 경우 수행할 작업을 추가할 수 있습니다.
  }
}

// Future<void> sendDataToBackendinfo(double currentZoom,
//     double currentlatitude, double currentlongitude) async {
//   final url = Uri.parse(
//       'http://BACKEND_IP:BACKEND_PORT'); // 여기에 백엔드의 URL을 입력해야 합니다.
//
//   final response = await http.post(
//     url,
//     headers: {'Content-Type': 'application/json'},
//     body: json.encode({
//       'currentZoom': currentZoom,
//       'currentlatitude': currentlatitude,
//       'currentlongitude': currentlongitude
//     }),
//   );


Future<void> sendDataToBackendinfo(double southLatitude,double westLongitude, double northLatitude, double eastLongitude) async {
  final url = Uri.parse(
      'http://BACKEND_IP:BACKEND_PORT'); // 여기에 백엔드의 URL을 입력해야 합니다.

  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: json.encode({
    'southLatitude': southLatitude,
    'westLongitude':westLongitude,
    'northLatitude': northLatitude,
    'eastLongitude': eastLongitude}
    ),
  );


  if (response.statusCode == 200) {
    print('Data sent successfully to the backend.');
    // 백엔드로 데이터가 성공적으로 보내졌을 경우 수행할 작업을 추가할 수 있습니다.
  } else {
    print('Failed to send data to the backend.');
    // 백엔드로 데이터를 보내는 데 실패한 경우 수행할 작업을 추가할 수 있습니다.
  }
}

Future<int> fetchDataFromServer() async {
  final url = Uri.parse(
      'http://example.com/data'); // 여기에 서버의 URL을 입력해야 합니다.

  final response = await http.get(url);

  if (response.statusCode == 200) {
    // 서버로부터 받은 데이터를 파싱하여 YourDataModel 객체로 변환합니다.
    return int.parse(json.decode(response.body));
  } else {
    // 오류가 발생했을 경우, 예외를 발생시킵니다.
    throw Exception('Failed to load data from the server');
  }
}
