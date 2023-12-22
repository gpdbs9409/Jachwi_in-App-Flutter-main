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
