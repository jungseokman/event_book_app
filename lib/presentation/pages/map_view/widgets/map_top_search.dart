import 'package:event_book_app/config/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class MapTopSearch extends StatelessWidget {
  const MapTopSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 57.h, left: 25.w, right: 25.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 262.w,
            height: 51.h,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.greyColors[16],
              ),
              borderRadius: BorderRadius.circular(12.h),
              color: AppColors.whiteColors[0],
              boxShadow: [
                BoxShadow(
                  color: AppColors.greyColors[17].withOpacity(0.5),
                  blurRadius: 60,
                  offset: Offset(0, 40.h),
                )
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 17.34.w),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      context.pop();
                    },
                    child: Image.asset(
                      "assets/icons/left_arrow.png",
                      height: 12.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Expanded(
                    child: TextField(
                      style: TextStyles.text6,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Find for food or restaurant...",
                        hintStyle: TextStyles.text6.copyWith(
                            color: AppColors.greyColors[15].withOpacity(0.5)),
                        contentPadding: EdgeInsets.zero,
                      ),
                      cursorColor: AppColors.blackColors[0],
                      cursorHeight: 17.h,
                      cursorWidth: 1.5.w,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 51.w,
            height: 51.h,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.greyColors[16],
              ),
              borderRadius: BorderRadius.circular(12.h),
              color: AppColors.whiteColors[0],
              boxShadow: [
                BoxShadow(
                  color: AppColors.greyColors[17].withOpacity(0.5),
                  blurRadius: 60,
                  offset: Offset(0, 40.h),
                )
              ],
            ),
            alignment: Alignment.center,
            child: Image.asset(
              "assets/icons/current_location.png",
              width: 22.w,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
