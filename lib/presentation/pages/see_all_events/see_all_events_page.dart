import 'package:event_book_app/common/constants.dart';
import 'package:event_book_app/common/styles.dart';
import 'package:event_book_app/presentation/widgets/appbar_search_more.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SeeAllEventsPage extends StatelessWidget {
  const SeeAllEventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColors[0],
      body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              //* Appbar
              const AppbarSearchMore(title: "Events"),

              //* 리스트 컴포넌트
              Expanded(
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        top: index == 0 ? 24.h : 0,
                        bottom:
                            index == Constants.dummyData.length - 1 ? 24.h : 0,
                      ),
                      child: Center(
                        child: Container(
                          width: 327.w,
                          height: 106.h,
                          decoration: BoxDecoration(
                            color: AppColors.whiteColors[0],
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color:
                                    AppColors.blueColors[2].withOpacity(0.06),
                                blurRadius: 35,
                                offset: Offset(0, 10.h),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 8.w),
                                child: Image.asset(
                                  Constants.dummyData[index]["image"]!,
                                  width: 79.w,
                                  height: 92.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                width: 18.w,
                              ),
                              Expanded(
                                  child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      Text(
                                        Constants.dummyData[index]["date"]!,
                                        style: TextStyles.text3,
                                      ),
                                      SizedBox(
                                        height: 4.h,
                                      ),
                                      Text(
                                        Constants.dummyData[index]["title"]!,
                                        style: TextStyles.title2,
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 12.h),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "assets/icons/map-pin.png",
                                          width: 14.w,
                                          height: 14.h,
                                          fit: BoxFit.cover,
                                        ),
                                        SizedBox(
                                          width: 6.w,
                                        ),
                                        Text(
                                          Constants.dummyData[index]
                                              ["location"]!,
                                          style: TextStyles.text3.copyWith(
                                              color: AppColors.greyColors[1]),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )),
                              SizedBox(
                                width: 14.89.w,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 12.h,
                    );
                  },
                  itemCount: Constants.dummyData.length,
                ),
              ),
            ],
          )),
    );
  }
}
