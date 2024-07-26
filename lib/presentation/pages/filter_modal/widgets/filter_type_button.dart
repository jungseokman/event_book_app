import 'package:event_book_app/config/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterTypeButton extends StatelessWidget {
  const FilterTypeButton({
    super.key,
    required this.focusfilterType,
    required this.whatfilterType,
    required this.image,
    required this.text,
    required this.onTap,
    this.isRightPadding = true,
  });

  final List<int> focusfilterType;
  final int whatfilterType;
  final String image;
  final String text;
  final VoidCallback onTap;
  final bool isRightPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: isRightPadding ? 15.61.w : 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onTap,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              width: 63.29.w,
              height: 63.29.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: focusfilterType.contains(whatfilterType)
                    ? AppColors.blueColors[0]
                    : AppColors.whiteColors[0],
                boxShadow: focusfilterType.contains(whatfilterType)
                    ? [
                        BoxShadow(
                          color: AppColors.blueColors[0].withOpacity(0.25),
                          blurRadius: 21.68,
                          offset: Offset(0, 8.67.h),
                        )
                      ]
                    : [],
                border: Border.all(
                  color: focusfilterType.contains(whatfilterType)
                      ? AppColors.blueColors[0]
                      : AppColors.greyColors[12],
                ),
              ),
              child: Image.asset(
                image,
                width: 29.53.w,
                fit: BoxFit.cover,
                color: focusfilterType.contains(whatfilterType)
                    ? AppColors.whiteColors[0]
                    : AppColors.greyColors[11],
              ),
            ),
          ),
          Text(
            text,
            style: TextStyles.text6,
          ),
        ],
      ),
    );
  }
}
