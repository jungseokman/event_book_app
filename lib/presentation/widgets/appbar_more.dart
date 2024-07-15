import 'package:event_book_app/common/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppbarMore extends StatelessWidget {
  const AppbarMore({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      height: 36.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                "assets/icons/Back.png",
                width: 22.w,
                height: 22.h,
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: 11.w,
              ),
              Text(
                "Events",
                style: TextStyles.title1,
              ),
            ],
          ),
          Image.asset(
            "assets/icons/More.png",
            width: 22.w,
            height: 22.h,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
