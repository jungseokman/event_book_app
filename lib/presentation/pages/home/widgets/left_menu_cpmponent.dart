import 'package:event_book_app/config/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LeftMenuComponent extends StatelessWidget {
  const LeftMenuComponent({
    super.key,
    required this.icon,
    required this.text,
    this.isSizedBoxWidth = true,
    this.isPaddingBottom = true,
    this.onTap,
  });

  final String icon;
  final String text;
  final bool isSizedBoxWidth;
  final bool isPaddingBottom;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: isPaddingBottom ? 33.h : 0),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Image.asset(
              icon,
              height: 23.h,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: isSizedBoxWidth ? 14.w : 8.5.w,
            ),
            Text(
              text,
              style: TextStyles.text2.copyWith(
                color: AppColors.blackColors[1],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
