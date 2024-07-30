import 'package:event_book_app/config/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MapTypeListItem extends StatelessWidget {
  const MapTypeListItem({
    super.key,
    this.isRightPadding = true,
    required this.title,
    required this.imgPath,
    required this.color,
  });

  final bool isRightPadding;
  final String imgPath;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: isRightPadding ? 10.36.w : 0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: AppColors.whiteColors[0],
          borderRadius: BorderRadius.circular(20.h),
          boxShadow: [
            BoxShadow(
              color: AppColors.greyColors[19].withOpacity(0.3),
              blurRadius: 4.29,
              offset: Offset(0, 2.15.h),
            )
          ],
        ),
        child: Row(
          children: [
            Image.asset(
              imgPath,
              height: 19.64.h,
              fit: BoxFit.cover,
              color: color,
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              title,
              style: TextStyles.text13,
            )
          ],
        ),
      ),
    );
  }
}
