import 'package:event_book_app/config/styles.dart';
import 'package:event_book_app/presentation/pages/map_view/widgets/map_top_search.dart';
import 'package:event_book_app/presentation/pages/map_view/widgets/map_type_list.dart';
import 'package:event_book_app/presentation/pages/map_view/widgets/map_type_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';

class MapViewPage extends StatefulWidget {
  const MapViewPage({super.key});

  @override
  State<MapViewPage> createState() => _MapViewPageState();
}

class _MapViewPageState extends State<MapViewPage> {
  late NaverMapController _controller;
  final defaultPosition = const NLatLng(37.5665, 126.9780);
  final defaultZoom = 15.0;

  @override
  void initState() {
    super.initState();
    _determinePosition().then((position) {
      final target = position != null
          ? NLatLng(position.latitude, position.longitude)
          : defaultPosition;
      _controller.updateCamera(
        NCameraUpdate.scrollAndZoomTo(
          target: target,
          zoom: defaultZoom,
        ),
      );
      _controller.addOverlay(NMarker(id: "1", position: target));
    });
  }

  void onMapReady(NaverMapController controller) {
    _controller = controller;
    _controller.updateCamera(
      NCameraUpdate.scrollAndZoomTo(
        target: const NLatLng(37.5665, 126.9780),
        zoom: 15,
      ),
    );
  }

  Future<Position?> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    //? 위치 서비스가 활성화되어 있는지 확인합니다.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return null;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return null;
    }

    //? 현재 위치를 반환합니다.
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteColors[0],
        body: Stack(
          children: [
            //* 네이버 맵
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: NaverMap(
                onMapReady: onMapReady,
                options: NaverMapViewOptions(
                  initialCameraPosition: NCameraPosition(
                    target: defaultPosition,
                    zoom: defaultZoom,
                  ),
                ),
              ),
            ),

            //* 상단 검색, 현재 위치 버튼 부분
            const MapTopSearch(),

            //* 유형 선택 버튼 리스트
            const MapTypeList(),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: PageView(),
            ),
          ],
        ));
  }
}
