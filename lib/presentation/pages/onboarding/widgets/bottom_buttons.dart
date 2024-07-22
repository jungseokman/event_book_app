import 'package:event_book_app/config/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({
    super.key,
    required this.onboardingType,
    required this.onTap,
  });

  final int onboardingType;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 295.w,
      height: 34.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              context.goNamed("signin");
            },
            child: Text(
              "Skip",
              style: TextStyles.title4.copyWith(
                color: AppColors.whiteColors[0].withOpacity(0.5),
              ),
            ),
          ),
          Row(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: 8.w,
                height: 8.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: onboardingType == 1
                      ? AppColors.whiteColors[0]
                      : AppColors.whiteColors[0].withOpacity(0.2),
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: 8.w,
                height: 8.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: onboardingType == 2
                      ? AppColors.whiteColors[0]
                      : AppColors.whiteColors[0].withOpacity(0.2),
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: 8.w,
                height: 8.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: onboardingType == 3
                      ? AppColors.whiteColors[0]
                      : AppColors.whiteColors[0].withOpacity(0.2),
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: onTap,
            child: Text(
              "Next",
              style: TextStyles.title4,
            ),
          )
        ],
      ),
    );
  }
}
