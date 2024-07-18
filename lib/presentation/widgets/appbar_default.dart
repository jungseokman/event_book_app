import 'package:event_book_app/config/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AppbarDefault extends StatelessWidget {
  const AppbarDefault({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      height: 36.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  if (context.canPop()) {
                    context.pop();
                  }
                },
                child: Image.asset(
                  "assets/icons/Back.png",
                  width: 22.w,
                  height: 22.h,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 11.w,
              ),
              Text(
                title,
                style: TextStyles.title1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
