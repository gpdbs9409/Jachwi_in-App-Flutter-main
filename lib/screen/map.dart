import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:ja_chuiin/Functions/ToBackend.dart';
import 'package:ja_chuiin/models/Positioninfos.dart';
import 'package:ja_chuiin/screen/1.log_in.dart';
import 'package:ja_chuiin/utilities/Colors.dart';
import 'package:ja_chuiin/utilities/SizeConfig.dart';

Map<String, double> convertBoundsToDoubles(NLatLngBounds bounds) {
  return {
    'southLatitude': bounds.southLatitude,
    'westLongitude': bounds.westLongitude,
    'northLatitude': bounds.northLatitude,
    'eastLongitude': bounds.eastLongitude,
  };
}

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
  @override
  Widget build(BuildContext context) {
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
        toolbarHeight: SizeConfig.deviceHeight * 0.1,
        backgroundColor: myColor, // 앱바의 배경색을 myColor로 설정합니다.
      ),
      body: ListView(
    children: [
    SizedBox(height: 20), // 상단에 적당한 여백을 주었습니다.
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
    ),
    ),
    SizedBox(height: 20), // 버튼과 지도 사이에 적당한 여백을 주었습니다.
    Container(
    width: 0.7 * SizeConfig.deviceWidth,
    // Container의 높이를 지정하지 않고, Flexible 또는 Expanded로 감쌉니다.
    child: Flexible(
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
              forceGesture: false,

              onMapReady: (controller) async {
                mapController = controller;
                var cameraPosition = await controller.getCameraPosition();

                // // 현재 카메라 위치의 정보를 변수에 저장합니다.
                // var currentTarget = cameraPosition.target;
                // var currentlatitude = currentTarget.latitude;
                // var currentlongitude = currentTarget.longitude;
                // var currentZoom = cameraPosition.zoom;
                //
                // sendDataToBackendinfo(
                //     currentZoom, currentlatitude, currentlongitude);
                // fetchDataFromServer();


                var contentBounds = await controller.getContentBounds(withPadding: true);
                var boundsDoubles = convertBoundsToDoubles(contentBounds);
                sendDataToBackendinfo(
                    boundsDoubles['southLatitude']!,
                    boundsDoubles['westLongitude']!,
                    boundsDoubles['northLatitude']!,
                    boundsDoubles['eastLongitude']!
                );
                fetchDataFromServer();
              },

              onMapTapped: (point, latLng) {},
              onSymbolTapped: (symbol) {},
              onCameraChange: (position, reason) {},
              onCameraIdle: () {},
              onSelectedIndoorChanged: (indoor) {},
            )),
    ) ]),
    );
  }
}
