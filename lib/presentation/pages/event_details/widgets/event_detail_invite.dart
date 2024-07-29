import 'package:event_book_app/config/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventDetailInvite extends StatelessWidget {
  const EventDetailInvite({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 191.h),
      child: Container(
        width: 295.w,
        height: 60.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.h),
          color: AppColors.whiteColors[0],
          boxShadow: [
            BoxShadow(
              color: AppColors.blackColors[7].withOpacity(0.1),
              blurRadius: 20,
              offset: Offset(0, 20.h),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/images/peaple.png",
                    width: 79.74.w,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    width: 9.24.w,
                  ),
                  Text(
                    "+20 Going",
                    style: TextStyles.text1.copyWith(
                      color: AppColors.blueColors[9],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Container(
                width: 67.w,
                height: 28.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.h),
                  color: AppColors.blueColors[0],
                ),
                alignment: Alignment.center,
                child: Text(
                  "Invite",
                  style: TextStyles.text5,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
