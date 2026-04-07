import 'package:flutter/material.dart';

// Web stub - flutter_naver_map is not supported on web
// These classes are no-ops to allow the code to compile

class NaverMapSdk {
  static final NaverMapSdk instance = NaverMapSdk._();
  NaverMapSdk._();
  Future<void> initialize({required String clientId}) async {}
}

class NaverMapController {
  Future<NLatLngBounds> getContentBounds({bool withPadding = false}) async {
    return NLatLngBounds(
        southLatitude: 0, westLongitude: 0, northLatitude: 0, eastLongitude: 0);
  }

  Future<void> addOverlay(dynamic overlay) async {}
}

class NCameraPosition {
  final NLatLng target;
  final double zoom;
  final double bearing;
  final double tilt;

  const NCameraPosition({
    required this.target,
    this.zoom = 15,
    this.bearing = 0,
    this.tilt = 0,
  });
}

class NLatLng {
  final double latitude;
  final double longitude;

  const NLatLng(this.latitude, this.longitude);
}

class NLatLngBounds {
  final double southLatitude;
  final double westLongitude;
  final double northLatitude;
  final double eastLongitude;

  NLatLngBounds({
    required this.southLatitude,
    required this.westLongitude,
    required this.northLatitude,
    required this.eastLongitude,
  });
}

class NMarker {
  final String id;
  final NLatLng position;

  NMarker({required this.id, required this.position});

  void setMinZoom(double zoom) {}
  void setMaxZoom(double zoom) {}
  void setIsMinZoomInclusive(bool v) {}
  void setIsMaxZoomInclusive(bool v) {}
}

class NaverMapViewOptions {
  final NCameraPosition? initialCameraPosition;
  final bool rotationGesturesEnable;
  final bool scrollGesturesEnable;
  final bool tiltGesturesEnable;
  final bool zoomGesturesEnable;
  final bool stopGesturesEnable;

  const NaverMapViewOptions({
    this.initialCameraPosition,
    this.rotationGesturesEnable = true,
    this.scrollGesturesEnable = true,
    this.tiltGesturesEnable = true,
    this.zoomGesturesEnable = true,
    this.stopGesturesEnable = true,
  });
}

class NaverMap extends StatelessWidget {
  final NaverMapViewOptions options;
  final Function(NaverMapController)? onMapReady;
  final Function(dynamic, dynamic)? onMapTapped;
  final Function(dynamic)? onSymbolTapped;
  final Function(dynamic, dynamic)? onCameraChange;
  final Function()? onCameraIdle;
  final Function(dynamic)? onSelectedIndoorChanged;

  const NaverMap({
    Key? key,
    required this.options,
    this.onMapReady,
    this.onMapTapped,
    this.onSymbolTapped,
    this.onCameraChange,
    this.onCameraIdle,
    this.onSelectedIndoorChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('지도는 모바일 앱에서 지원됩니다'));
  }
}
