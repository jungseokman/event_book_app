import 'package:event_book_app/config/styles.dart';
import 'package:event_book_app/presentation/pages/map_view/widgets/map_type_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MapTypeList extends StatelessWidget {
  const MapTypeList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 128.h,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 40.h,
        child: ListView(
          scrollDirection: Axis.horizontal,
          clipBehavior: Clip.none,
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          children: [
            //* 유형 선택 버튼
            MapTypeListItem(
              imgPath: "assets/icons/ball_icon.png",
              color: AppColors.redColor[2],
              title: "Sports",
            ),
            MapTypeListItem(
              imgPath: "assets/icons/music_icon.png",
              color: AppColors.blueColors[13],
              title: "Music",
            ),
            MapTypeListItem(
              imgPath: "assets/icons/food_icon.png",
              color: AppColors.greenColor[0],
              title: "Food",
            ),
            MapTypeListItem(
              imgPath: "assets/icons/art_icon.png",
              color: AppColors.blueColors[14],
              title: "Art",
            ),
          ],
        ),
      ),
    );
  }
}
