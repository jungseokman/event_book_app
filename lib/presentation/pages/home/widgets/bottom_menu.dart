import 'package:event_book_app/config/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomMenu extends StatelessWidget {
  const BottomMenu({
    super.key,
    required this.image,
    required this.text,
    this.iconColor = true,
    this.textColor = true,
    this.onTap,
  });

  final String image;
  final String text;
  final bool iconColor;
  final bool textColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(
            image,
            width: 23.w,
            fit: BoxFit.cover,
            color: iconColor ? null : AppColors.greyColors[9],
          ),
          SizedBox(
            height: 2.h,
          ),
          Text(
            text,
            style: TextStyles.text5.copyWith(
              color:
                  textColor ? AppColors.blueColors[0] : AppColors.greyColors[9],
            ),
          )
        ],
      ),
    );
  }
}
