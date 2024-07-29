import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:event_book_app/config/styles.dart';

class EventDetailMiddleWidget extends StatelessWidget {
  const EventDetailMiddleWidget({
    super.key,
    required this.image,
    required this.title,
    required this.text,
  });

  final String image;
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 5.h),
          child: Container(
            width: 48.w,
            height: 48.h,
            decoration: BoxDecoration(
              color: AppColors.blueColors[0].withOpacity(0.1),
              borderRadius: BorderRadius.circular(12.w),
            ),
            alignment: Alignment.center,
            child: Image.asset(
              image,
              width: 30.w,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: 14.w,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyles.title9.copyWith(height: 34 / 16),
            ),
            Text(
              text,
              style: TextStyles.text5.copyWith(
                color: AppColors.greyColors[1],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
