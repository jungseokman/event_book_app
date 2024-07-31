import 'package:event_book_app/config/styles.dart';
import 'package:event_book_app/presentation/pages/map_view/widgets/bottom_page_view.dart';
import 'package:event_book_app/presentation/pages/map_view/widgets/map_top_search.dart';
import 'package:event_book_app/presentation/pages/map_view/widgets/map_type_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';

class MapViewPage extends StatefulWidget {
  const MapViewPage({super.key});

  @override
  State<MapViewPage> createState() => _MapViewPageState();
}

class _MapViewPageState extends State<MapViewPage> {
  late NaverMapController _controller;
  NLatLng defaultPosition = const NLatLng(37.5665, 126.9780);
  final defaultZoom = 15.0;

  @override
  void initState() {
    super.initState();
    _determinePosition().then((position) {
      List<NLatLng> markerPositions = [];

      if (position != null) {
        defaultPosition = NLatLng(position.latitude, position.longitude);

        markerPositions = [
          NLatLng(position.latitude, position.longitude),
          NLatLng(position.latitude - 0.002, position.longitude - 0.002),
          NLatLng(position.latitude + 0.002, position.longitude - 0.002),
          NLatLng(position.latitude - 0.002, position.longitude + 0.002),
        ];
      } else {
        markerPositions = [
          const NLatLng(37.5655, 126.9760),
          const NLatLng(37.5670, 126.9790),
          const NLatLng(37.5675, 126.9770),
          const NLatLng(37.5640, 126.9755),
        ];
      }

      _controller.updateCamera(
        NCameraUpdate.scrollAndZoomTo(
          target: defaultPosition,
          zoom: defaultZoom,
        ),
      );

      _addMultipleMarkers(markerPositions);
    });
  }

  void _addMultipleMarkers(List<NLatLng> positions) {
    for (int i = 0; i < positions.length; i++) {
      if (i % 4 == 0) {
        final marker = NMarker(
          id: i.toString(),
          position: positions[i],
          icon: const NOverlayImage.fromAssetImage('assets/icons/marker1.png'),
        );
        _controller.addOverlay(marker);
      } else if (i % 4 == 1) {
        final marker = NMarker(
          id: i.toString(),
          position: positions[i],
          icon: const NOverlayImage.fromAssetImage('assets/icons/marker2.png'),
        );
        _controller.addOverlay(marker);
      } else if (i % 4 == 2) {
        final marker = NMarker(
          id: i.toString(),
          position: positions[i],
          icon: const NOverlayImage.fromAssetImage('assets/icons/marker3.png'),
        );
        _controller.addOverlay(marker);
      } else {
        final marker = NMarker(
          id: i.toString(),
          position: positions[i],
          icon: const NOverlayImage.fromAssetImage('assets/icons/marker4.png'),
        );
        _controller.addOverlay(marker);
      }
    }
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
            MapTopSearch(
              ontap: () {
                _controller.updateCamera(
                  NCameraUpdate.scrollAndZoomTo(
                    target: defaultPosition,
                    zoom: defaultZoom,
                  ),
                );
              },
            ),

            //* 유형 선택 버튼 리스트
            const MapTypeList(),

            //* 하단 페이지뷰
            const BottomPageView(),
          ],
        ));
  }
}
