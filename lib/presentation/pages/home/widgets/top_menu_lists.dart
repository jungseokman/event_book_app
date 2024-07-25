import 'package:event_book_app/config/styles.dart';
import 'package:event_book_app/presentation/pages/home/widgets/top_menu_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopMenuLists extends StatelessWidget {
  const TopMenuLists({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: (185 - (39.42 / 2)).h,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 39.42.h,
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.none,
                  children: [
                    TopMenuList(
                      imagePath: "assets/icons/menu1.png",
                      text: "Sports",
                      bgColor: AppColors.redColor[0],
                    ),
                    SizedBox(
                      width: 11.28.w,
                    ),
                    TopMenuList(
                      imagePath: "assets/icons/menu2.png",
                      text: "Music",
                      bgColor: AppColors.redColor[1],
                    ),
                    SizedBox(
                      width: 11.28.w,
                    ),
                    TopMenuList(
                      imagePath: "assets/icons/menu3.png",
                      text: "Food",
                      bgColor: AppColors.greenColor[0],
                    ),
                    SizedBox(
                      width: 11.28.w,
                    ),
                    TopMenuList(
                      imagePath: "assets/icons/bell.png",
                      text: "Bell",
                      bgColor: AppColors.blueColors[8],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
