import 'package:event_book_app/config/styles.dart';
import 'package:event_book_app/presentation/pages/home/widgets/bottom_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomSheetComponent extends StatelessWidget {
  const BottomSheetComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 88.h,
              decoration: BoxDecoration(
                color: AppColors.whiteColors[0],
                boxShadow: [
                  BoxShadow(
                    color: AppColors.greyColors[8].withOpacity(0.13),
                    blurRadius: 8,
                    offset: Offset(0, -3.h),
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Positioned(
                    left: 28.w,
                    bottom: 31.h,
                    child: const BottomMenu(
                      image: "assets/icons/explore.png",
                      text: "Explore",
                    ),
                  ),
                  Positioned(
                    left: 107.w,
                    bottom: 31.h,
                    child: const BottomMenu(
                      image: "assets/icons/events.png",
                      text: "Events",
                      iconColor: false,
                      textColor: false,
                    ),
                  ),
                  Positioned(
                    right: 109.w,
                    bottom: 31.h,
                    child: const BottomMenu(
                      image: "assets/icons/map.png",
                      text: "Events",
                      iconColor: false,
                      textColor: false,
                    ),
                  ),
                  Positioned(
                    right: 32.w,
                    bottom: 31.h,
                    child: const BottomMenu(
                      image: "assets/icons/profile_fill.png",
                      text: "Prfile",
                      iconColor: false,
                      textColor: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 65.h,
            child: Container(
              width: 46.w,
              height: 46.h,
              decoration: BoxDecoration(
                color: AppColors.blueColors[0],
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.blueColors[4].withOpacity(0.25),
                    blurRadius: 20,
                    offset: Offset(0, 8.h),
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Image.asset(
                "assets/icons/add_box.png",
                width: 20.w,
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
