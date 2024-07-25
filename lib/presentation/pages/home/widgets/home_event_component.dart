import 'package:event_book_app/config/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeEventComponent extends StatelessWidget {
  const HomeEventComponent({
    super.key,
    required this.bgImage,
    required this.title,
    required this.location,
  });

  final String bgImage;
  final String title;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 237.w,
      height: 255.h,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColors[4].withOpacity(0.06),
            blurRadius: 30,
            offset: Offset(0, 8.h),
          ),
        ],
        color: AppColors.whiteColors[0],
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 9.h,
          ),
          Container(
            width: 218.w,
            height: 131.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  bgImage,
                ),
              ),
            ),
            padding: EdgeInsets.all(8.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 45.w,
                  height: 45.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.w),
                    color: AppColors.whiteColors[0].withOpacity(0.7),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "10",
                        style: TextStyles.title4.copyWith(
                          color: AppColors.redColor[0],
                          height: 1.1,
                        ),
                      ),
                      Text(
                        "JUNE",
                        style: TextStyles.text9.copyWith(
                          color: AppColors.redColor[0],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 30.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.w),
                    color: AppColors.whiteColors[0].withOpacity(0.7),
                  ),
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/icons/bookmark.png",
                    width: 14.1.w,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 14.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyles.title4.copyWith(
                        color: AppColors.blackColors[1],
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/peaple.png",
                          width: 56.w,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          width: 10.h,
                        ),
                        Text(
                          "+20 Going",
                          style: TextStyles.text5.copyWith(
                            color: AppColors.blueColors[9],
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/icons/map-pin.png",
                          width: 16.w,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          width: 5.h,
                        ),
                        Text(
                          location,
                          style: TextStyles.text3.copyWith(
                            color: AppColors.greyColors[0],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
