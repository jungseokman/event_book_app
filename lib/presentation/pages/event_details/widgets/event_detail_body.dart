import 'package:event_book_app/config/styles.dart';
import 'package:event_book_app/presentation/pages/event_details/widgets/event_detail_middle_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventDetailBody extends StatelessWidget {
  const EventDetailBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 271.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "International Band Music Concert",
                  style: TextStyles.title5.copyWith(
                    color: AppColors.blackColors[0],
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(
                  height: 18.h,
                ),
                const EventDetailMiddleWidget(
                  image: "assets/icons/calender_blue.png",
                  title: "14 December, 2021",
                  text: "Tuesday, 4:00PM - 9:00PM",
                ),
                SizedBox(
                  height: 16.h,
                ),
                const EventDetailMiddleWidget(
                  image: "assets/icons/location_blue.png",
                  title: "Gala Convention Center",
                  text: "36 Guild Street London, UK",
                ),
                SizedBox(
                  height: 24.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/detail_sample.png",
                          width: 48.w,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          width: 13.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Ashfak Sayem",
                              style: TextStyles.text1,
                            ),
                            Text(
                              "Organizer",
                              style: TextStyles.text5.copyWith(
                                color: AppColors.greyColors[1],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Container(
                      width: 60.w,
                      height: 28.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.h),
                        color: AppColors.blueColors[0].withOpacity(0.12),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Follow",
                        style: TextStyles.text5.copyWith(
                          color: AppColors.blueColors[0],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 21.h,
                ),
                Text(
                  "About Event",
                  style: TextStyles.title1.copyWith(
                    fontSize: 18.sp,
                    height: 34 / 18,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:
                            "Enjoy your favorite dishe and a lovely your friends and family and have a great time. Food from local food trucks will be available for purchase.",
                        style: TextStyles.text12,
                      ),
                      TextSpan(
                        text: " Read More...",
                        style: TextStyles.text12
                            .copyWith(color: AppColors.blueColors[0]),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 150.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
