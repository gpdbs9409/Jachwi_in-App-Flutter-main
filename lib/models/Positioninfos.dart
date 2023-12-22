import 'dart:async';
import 'package:flutter_naver_map/flutter_naver_map.dart';



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


