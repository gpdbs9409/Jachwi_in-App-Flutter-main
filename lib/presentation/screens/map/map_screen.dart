import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ja_chuiin/utils/naver_map.dart';
import 'package:get/get.dart';
import 'package:ja_chuiin/core/constants/app_colors.dart';
import 'package:ja_chuiin/core/constants/size_config.dart';
import 'package:ja_chuiin/presentation/screens/map/map_view_model.dart';
import 'package:ja_chuiin/presentation/widgets/common_app_bar.dart';

class MapScreen extends StatelessWidget {
  final MapViewModel _viewModel = Get.put(MapViewModel());

  static const List<String> _categories = ['카페', '버스', '안전', '학교'];

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: CommonAppBar(),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          Center(
            child: Obx(() => Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                _categories.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        _viewModel.categorySelected[index]
                            ? kAccentDark
                            : kPrimaryLight,
                      ),
                    ),
                    onPressed: () => _viewModel.toggleCategory(index),
                    child: Text(
                      _categories[index],
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
            )),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 0.7 * SizeConfig.deviceWidth,
            height: 0.65 * SizeConfig.deviceHeight,
            child: kIsWeb
                ? const Center(child: Text('지도는 모바일 앱에서 지원됩니다'))
                : NaverMap(
                    options: NaverMapViewOptions(
                      initialCameraPosition: _viewModel.initialPosition,
                      rotationGesturesEnable: true,
                      scrollGesturesEnable: true,
                      tiltGesturesEnable: true,
                      zoomGesturesEnable: true,
                      stopGesturesEnable: true,
                    ),
                    onMapReady: _viewModel.onMapReady,
                    onMapTapped: (point, latLng) {},
                    onSymbolTapped: (symbol) {},
                    onCameraChange: (position, reason) {},
                    onCameraIdle: () {},
                    onSelectedIndoorChanged: (indoor) {},
                  ),
          ),
        ],
      ),
    );
  }
}
