import 'package:event_book_app/config/constants.dart';
import 'package:event_book_app/config/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSecondShadow extends StatelessWidget {
  const HomeSecondShadow({
    super.key,
    required this.menuState,
  });

  final bool menuState;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      top: 0,
      bottom: 0,
      left: menuState ? (251 - ((375 - 271) / 2)).w : 0,
      right: menuState ? -(147 + ((375 - 271) / 2)).w : 0,
      duration: const Duration(milliseconds: Constants.homeMenuAniDuration),
      child: AnimatedScale(
        duration: const Duration(milliseconds: Constants.homeMenuAniDuration),
        scale: menuState ? 271 / 375 : 1,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: AppColors.greyColors[10].withOpacity(0.06),
            borderRadius: BorderRadius.circular(40.h),
          ),
        ),
      ),
    );
  }
}
