import 'package:event_book_app/config/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RememberForgotComponent extends StatelessWidget {
  const RememberForgotComponent({
    super.key,
    required this.isSwitched,
    required this.ontap,
  });

  final bool isSwitched;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: ontap,
              child: Stack(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.fastOutSlowIn,
                    width: 32.3.w,
                    height: 19.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.h),
                      color: isSwitched
                          ? AppColors.blueColors[0]
                          : AppColors.greyColors[2],
                    ),
                  ),
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.fastOutSlowIn,
                    right: isSwitched ? 1.9.w : 15.2.w,
                    top: 0,
                    bottom: 0,
                    child: Container(
                      width: 15.2.w,
                      height: 15.2.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.whiteColors[0],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 8.7.w,
            ),
            Text(
              "Remember Me",
              style: TextStyles.text6,
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            context.pushNamed("ressetPassword");
          },
          child: Text(
            "Forgot Password?",
            style: TextStyles.text6,
          ),
        ),
      ],
    );
  }
}
