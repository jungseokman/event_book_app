import 'package:event_book_app/config/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.onTap,
    this.bottomPadding,
  });

  final String title;
  final VoidCallback onTap;
  final double? bottomPadding;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: bottomPadding ?? 0),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
              width: 271.w,
              height: 58.h,
              decoration: BoxDecoration(
                color: AppColors.blueColors[0],
                borderRadius: BorderRadius.circular(15.h),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Text(
                      title,
                      style: TextStyles.text2.copyWith(
                          color: AppColors.whiteColors[0],
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 14.w),
                      child: Container(
                        width: 30.w,
                        height: 30.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.blueColors[1],
                          borderRadius: BorderRadius.circular(15.h),
                        ),
                        child: Image.asset(
                          "assets/icons/Shape.png",
                          width: 13.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
