import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:http/http.dart' as http;
import 'package:ja_chuiin/screen/1.log_in.dart';

const latLng1 = NLatLng(37.6318332, 127.0795142);
const latLng2 = NLatLng(37.6290734, 127.0826410);
const latLng3 = NLatLng(37.484147, 127.034631);
double CurrentZoomLevel = 0;
double CurrentPosition = 0;

/// 카메라를 업데이트시킬 수 있어요
Future<bool> updateCamera(NCameraUpdate cameraUpdate) {
  // TODO: implement updateCamera
  throw UnimplementedError();
}

/// 카메라가 애니메이션과 함께 이동할 때, 이동 도중 애니메이션을 멈출 수 있어요
Future<void> cancelTransitions(
    {NCameraUpdateReason reason = NCameraUpdateReason.developer}) {
  // TODO: implement cancelTransitions
  throw UnimplementedError();
}

/// 카메라 포지션(정보)를 가져올 수 있어요.
Future<NCameraPosition> getCameraPosition() {
  // TODO: implement getCameraPosition
  throw UnimplementedError();
}

/// 지금 카메라로 보고 있는 컨텐츠 영역을 가져올 수 있어요.
/// withPadding이 true면, NaverMapViewOptions.contentPadding이 적용된 영역만 가져올 수 있어요.
/// getContentBounds와 getContentRegion은 반환 타입만 달라요.
Future<NLatLngBounds> getContentBounds({bool withPadding = false}) {
  // TODO: implement getContentBounds
  throw UnimplementedError();
}

Future<List<NLatLng>> getContentRegion({bool withPadding = false}) {
  // TODO: implement getContentRegion
  throw UnimplementedError();
}

final marker = NMarker(id: "test", position: latLng1);
final marker1 = NMarker(id: '1', position: latLng2);
final marker2 = NMarker(id: '2', position: latLng3); //서울시청의 범위
final List<NMarker> markers = [marker, marker1, marker2];

final circle = NCircleOverlay(id: '1', center: latLng1);

final onMarkerInfoWindow = NInfoWindow.onMarker(id: marker.info.id, text: "5개");
late NaverMapController mapController;
List<bool> onChecked = List<bool>.filled(10, false);

const img = NOverlayImage.fromAssetImage('assets/images/my_logo.png');

class MyButton extends StatefulWidget {
  final String text;
  final int index;

  MyButton({required this.text, required this.index});

  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (isPressed) {
              return Color(0xFF56147B); // pressed 상태일 때의 색
            }
            return Color(0xFFDFACEC); // default 상태일 때의 색
          },
        ),
      ),
      child: Text(
        widget.text, // 생성자에서 받은 텍스트를 사용합니다.
        style: TextStyle(color: Colors.black),
      ),
      onPressed: () {
        setState(() {
          isPressed = !isPressed;
          onChecked[widget.index] = true; // 생성자에서 받은 인덱스를 사용합니다.
          mapController.addOverlay(markers[widget.index]);
          marker.setMinZoom(12);
          marker.setMaxZoom(18);
          marker.setIsMinZoomInclusive(true);
          marker.setIsMaxZoomInclusive(false);
        });
      },
    );
  }
}

class MyMAP extends StatelessWidget {
  Color myColor = Color.fromARGB(255, 86, 20, 123);

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('자취인'),
        actions: <Widget>[
          IconButton(
            // 오른쪽에 위치하는 첫 번째 버튼
            icon: Icon(Icons.search), // 원하는 아이콘으로 변경 가능
            onPressed: () {},
          ),
          IconButton(
            // 오른쪽에 위치하는 두 번째 버튼
            icon: Icon(Icons.settings), // 원하는 아이콘으로 변경 가능
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => LOGIN()));
            },
          ),
        ],
        toolbarHeight: deviceHeight * 0.1,
        backgroundColor: myColor, // 앱바의 배경색을 myColor로 설정합니다.
      ),
      body: Column(children: [
        SizedBox(
          height: deviceHeight * 0.05,
        ),
        Center(
            child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            MyButton(text: '카페', index: 0),
            SizedBox(width: 10),
            MyButton(text: '버스', index: 1),
            SizedBox(width: 10),
            MyButton(text: '안전', index: 2),
            SizedBox(width: 10),
            MyButton(text: '학교', index: 3),
            SizedBox(width: 10),
          ],
        )),
        SizedBox(height: 20),
        Container(
            width: 0.7 * deviceWidth,
            height: 0.7 * deviceHeight,
            child: NaverMap(
              options: const NaverMapViewOptions(
                initialCameraPosition: NCameraPosition(
                  target: NLatLng(37.6318332, 127.0795142),
                  zoom: 15,
                  bearing: 45,
                  tilt: 30,
                ),
                rotationGesturesEnable: true,
                scrollGesturesEnable: true,
                tiltGesturesEnable: true,
                zoomGesturesEnable: true,
                stopGesturesEnable: true,
              ),
              // 지도 옵션을 설정할 수 있습니다.
              forceGesture: false,
              // 지도에 전달되는 제스처 이벤트의 우선순위를 가장 높게 설정할지 여부를 지정합니다.
              onMapReady: (controller) async {
                mapController = controller;
                var cameraPosition = await controller.getCameraPosition();

                // 현재 카메라 위치의 정보를 변수에 저장합니다.
                var currentTarget = cameraPosition.target;
                var currentlatitude = currentTarget.latitude;
                var currentlongitude = currentTarget.longitude;
                var currentZoom = cameraPosition.zoom;

                Future<void> _sendDataToBackend(double currentZoom,
                    double currentlatitude, double currentlongitude) async {
                  final url = Uri.parse(
                      'http://BACKEND_IP:BACKEND_PORT'); // 여기에 백엔드의 URL을 입력해야 합니다.

                  final response = await http.post(
                    url,
                    headers: {'Content-Type': 'application/json'},
                    body: json.encode({
                      'currentZoom': currentZoom,
                      'currentlatitude': currentlatitude,
                      'currentlongitude': currentlongitude
                    }),
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

                _sendDataToBackend(
                    currentZoom, currentlatitude, currentlongitude);
                fetchDataFromServer();
              },

              onMapTapped: (point, latLng) {},
              onSymbolTapped: (symbol) {},
              onCameraChange: (position, reason) {},
              onCameraIdle: () {},
              onSelectedIndoorChanged: (indoor) {},
            )),
      ]),
    );
  }
}
