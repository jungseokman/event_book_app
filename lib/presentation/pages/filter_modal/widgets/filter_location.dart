import 'package:event_book_app/config/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterLocation extends StatelessWidget {
  const FilterLocation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Location",
          style: TextStyles.text10,
        ),
        SizedBox(
          height: 12.h,
        ),
        Container(
          height: 60.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.h),
              border: Border.all(color: AppColors.greyColors[12])),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 8.w,
                  ),
                  Container(
                    width: 45.w,
                    height: 45.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11.89.w),
                      color: AppColors.blueColors[0].withOpacity(0.15),
                    ),
                    alignment: Alignment.center,
                    child: Container(
                      width: 30.79.w,
                      height: 30.79.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.19.w),
                        color: AppColors.whiteColors[0],
                      ),
                      child: Image.asset(
                        "assets/icons/location_empty.png",
                        width: 15.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 18.w,
                  ),
                  Text(
                    "New Yourk, USA",
                    style: TextStyles.text2.copyWith(
                      color: AppColors.blackColors[6],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(right: 18.w),
                child: Image.asset(
                  "assets/icons/arrow_right_color.png",
                  height: 9.h,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
