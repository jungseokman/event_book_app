import 'package:event_book_app/config/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchAndFilter extends StatelessWidget {
  const SearchAndFilter({
    super.key,
    required this.textEditingController,
    required FocusNode focusNode,
  }) : _focusNode = focusNode;

  final TextEditingController textEditingController;
  final FocusNode _focusNode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        children: [
          Image.asset(
            "assets/icons/search_blue.png",
            width: 24.w,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: SizedBox(
              height: 26.h,
              child: TextField(
                controller: textEditingController,
                focusNode: _focusNode,
                cursorColor: AppColors.blueColors[3],
                cursorHeight: 26.h,
                cursorWidth: 1.w,
                style: TextStyles.text4,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 0.h),
                  border: InputBorder.none,
                  hintText: " Search...",
                  hintStyle: TextStyles.text4.copyWith(
                    color: AppColors.greyColors[3],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Container(
            width: 75.w,
            height: 32.14.h,
            padding: EdgeInsets.only(
              top: 4.06.h,
              bottom: 4.33.h,
              left: 4.29.w,
              right: 7.36.w,
            ),
            decoration: BoxDecoration(
              color: AppColors.blueColors[0],
              borderRadius: BorderRadius.circular(100.h),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/icons/filter.png",
                  width: 23.75.w,
                  fit: BoxFit.cover,
                ),
                Text(
                  "Filters",
                  style: TextStyles.text5,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
