import 'package:event_book_app/config/styles.dart';
import 'package:event_book_app/presentation/pages/event_details/widgets/event_detail_invite.dart';
import 'package:event_book_app/presentation/widgets/appbar_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventDetailsPage extends StatelessWidget {
  const EventDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColors[0],
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          //* 바디 부분
          SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  children: [
                    Image.asset(
                      "assets/images/detail_image.png",
                      width: MediaQuery.of(context).size.width,
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Column(
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
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 5.h),
                                child: Container(
                                  width: 48.w,
                                  height: 48.h,
                                  decoration: BoxDecoration(
                                    color: AppColors.blueColors[0]
                                        .withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(12.w),
                                  ),
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    "assets/icons/calender_blue.png",
                                    width: 30.w,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 14.w,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "14 December, 2021",
                                    style: TextStyles.title9
                                        .copyWith(height: 34 / 16),
                                  ),
                                  Text(
                                    "Tuesday, 4:00PM - 9:00PM",
                                    style: TextStyles.text5.copyWith(
                                      color: AppColors.greyColors[1],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                //* 친구 목록? & 초대버튼
                const EventDetailInvite()
              ],
            ),
          ),

          //* 앱 바
          Padding(
            padding: EdgeInsets.only(top: 48.h),
            child: const AppbarCustom(
              title: "Event Details",
              isBookMarkIcon: true,
              isBlackColor: false,
            ),
          ),
        ],
      ),
    );
  }
}
