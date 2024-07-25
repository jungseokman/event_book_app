import 'package:event_book_app/config/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopMenuList extends StatelessWidget {
  const TopMenuList({
    super.key,
    required this.imagePath,
    required this.text,
    required this.bgColor,
  });

  final String imagePath;
  final String text;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 16.49.w,
        right: 16.49.w,
        top: 9.h,
        bottom: 10.1.h,
      ),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(21.h),
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            offset: Offset(0, 6.h),
            color: AppColors.blackColors[3].withOpacity(0.12),
          )
        ],
      ),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            width: 17.73.w,
            fit: BoxFit.fill,
          ),
          SizedBox(
            width: 8.31.w,
          ),
          Text(
            text,
            style: TextStyles.text1.copyWith(
              color: AppColors.whiteColors[0],
            ),
          )
        ],
      ),
    );
  }
}
