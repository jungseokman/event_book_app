import 'package:event_book_app/common/styles.dart';
import 'package:event_book_app/presentation/widgets/appbar_more.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyEventsPage extends StatefulWidget {
  const EmptyEventsPage({super.key});

  @override
  State<EmptyEventsPage> createState() => _EmptyEventsPageState();
}

class _EmptyEventsPageState extends State<EmptyEventsPage> {
  bool eventTypeButton = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColors[0],
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                //* 앱바
                const AppbarMore(),
                SizedBox(
                  height: 20.12.h,
                ),
                //* 상단 버튼 2개
                Container(
                  width: 295.w,
                  height: 45.06.h,
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.w),
                    color: AppColors.blackColors[1].withOpacity(0.0287),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            eventTypeButton = true;
                          });
                        },
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 250),
                          transitionBuilder:
                              (Widget child, Animation<double> animation) {
                            return FadeTransition(
                                opacity: animation, child: child);
                          },
                          child: eventTypeButton
                              ? _buildSelectedButton("UPCOMING", true)
                              : _buildUnselectedButton("UPCOMING", false),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            eventTypeButton = false;
                          });
                        },
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 250),
                          transitionBuilder:
                              (Widget child, Animation<double> animation) {
                            return FadeTransition(
                                opacity: animation, child: child);
                          },
                          child: !eventTypeButton
                              ? _buildSelectedButton("PAST EVENTS", false)
                              : _buildUnselectedButton("PAST EVENTS", true),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 97.82.h,
                ),
                Image.asset(
                  "assets/images/empty_event.png",
                  width: 202.w,
                  height: 202.h,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 31.h,
                ),
                Text(
                  "No Upcoming Event",
                  style: TextStyles.title1,
                ),
                SizedBox(
                  height: 12.64.h,
                ),
                Text(
                  "Lorem ipsum dolor sit amet,",
                  style: TextStyles.text2,
                ),
                Text(
                  "consectetur",
                  style: TextStyles.text2,
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 33.h),
                child: Container(
                    width: 271.w,
                    height: 58.h,
                    decoration: BoxDecoration(
                      color: AppColors.blueColors[0],
                      borderRadius: BorderRadius.circular(15.h),
                    ),
                    child: Stack(
                      children: [
                        Center(
                          child: Text(
                            "Explore Events",
                            style: TextStyles.text2.copyWith(
                                color: AppColors.whiteColors[0],
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 14.w),
                            child: Container(
                              width: 30.w,
                              height: 30.h,
                              decoration: BoxDecoration(
                                color: AppColors.blueColors[1],
                                borderRadius: BorderRadius.circular(15.h),
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }

  //* 선택되었을때 버튼
  Widget _buildSelectedButton(String text, bool selected) {
    return Container(
      key: ValueKey(text + selected.toString()),
      width: 140.w,
      height: 35.04.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.w),
        color: AppColors.whiteColors[0],
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColors[1].withOpacity(0.1),
            blurRadius: 20.h,
            offset: Offset(0, 5.h),
          ),
        ],
      ),
      child: Text(
        text,
        style: TextStyles.text1.copyWith(
          color: AppColors.blueColors[0],
        ),
      ),
    );
  }

  //* 선택되지 않았을때 버튼
  Widget _buildUnselectedButton(String text, bool selected) {
    return Container(
      key: ValueKey(text + selected.toString()),
      width: 140.w,
      height: 35.04.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.w),
        color: Colors.transparent,
      ),
      child: Text(
        text,
        style: TextStyles.text1.copyWith(
          color: AppColors.greyColors[0],
        ),
      ),
    );
  }
}
