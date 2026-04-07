import 'package:ja_chuiin/utils/naver_map.dart';
import 'package:get/get.dart';
import 'package:ja_chuiin/data/models/map_bounds.dart';
import 'package:ja_chuiin/data/repositories/map_repository.dart';

class MapViewModel extends GetxController {
  final MapRepository _repository = MapRepository();

  late NaverMapController mapController;

  final RxList<bool> categorySelected = List<bool>.filled(4, false).obs;

  static const _initialPosition = NCameraPosition(
    target: NLatLng(37.6318332, 127.0795142),
    zoom: 15,
    bearing: 45,
    tilt: 30,
  );

  NCameraPosition get initialPosition => _initialPosition;

  final _marker0 = NMarker(id: 'cafe', position: const NLatLng(37.6318332, 127.0795142));
  final _marker1 = NMarker(id: 'bus', position: const NLatLng(37.6290734, 127.0826410));
  final _marker2 = NMarker(id: 'safe', position: const NLatLng(37.484147, 127.034631));

  late final List<NMarker> markers;

  @override
  void onInit() {
    super.onInit();
    markers = [_marker0, _marker1, _marker2];
  }

  Future<void> onMapReady(NaverMapController controller) async {
    mapController = controller;
    final contentBounds = await controller.getContentBounds(withPadding: true);
    await _fetchBuildings(contentBounds);
  }

  Future<void> _fetchBuildings(NLatLngBounds bounds) async {
    await _repository.fetchBuildingsInArea(MapBounds(
      southLatitude: bounds.southLatitude,
      westLongitude: bounds.westLongitude,
      northLatitude: bounds.northLatitude,
      eastLongitude: bounds.eastLongitude,
    ));
  }

  void toggleCategory(int index) {
    categorySelected[index] = !categorySelected[index];
    if (index < markers.length) {
      mapController.addOverlay(markers[index]);
      markers[index].setMinZoom(12);
      markers[index].setMaxZoom(18);
      markers[index].setIsMinZoomInclusive(true);
      markers[index].setIsMaxZoomInclusive(false);
    }
  }
}
