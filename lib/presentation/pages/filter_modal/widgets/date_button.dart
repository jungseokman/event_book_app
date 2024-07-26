import 'package:event_book_app/config/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DateButton extends StatelessWidget {
  const DateButton({
    super.key,
    required this.focusButton,
    required this.buttonNumber,
    required this.text,
    required this.onTap,
  });

  final int focusButton;
  final int buttonNumber;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: EdgeInsets.symmetric(
          horizontal: 19.w,
          vertical: 9.h,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            color: focusButton == buttonNumber
                ? AppColors.blueColors[0]
                : AppColors.greyColors[14],
          ),
          borderRadius: BorderRadius.circular(10.w),
          color: focusButton == buttonNumber
              ? AppColors.blueColors[0]
              : AppColors.whiteColors[0],
        ),
        child: Text(
          text,
          style: TextStyles.text1.copyWith(
            color: focusButton == buttonNumber
                ? AppColors.whiteColors[0]
                : AppColors.greyColors[13],
          ),
        ),
      ),
    );
  }
}
