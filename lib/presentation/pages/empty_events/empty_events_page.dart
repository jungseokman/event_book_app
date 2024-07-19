import 'package:event_book_app/config/styles.dart';
import 'package:event_book_app/presentation/widgets/appbar_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

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
        bottom: false,
        child: Stack(
          children: [
            Column(
              children: [
                //* 앱바
                const AppbarCustom(
                  title: "Events",
                  isMoreIcon: true,
                ),
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
                        //! AnimatedContainer : container의 색상, 크기등 애니메이션 효과 (색상부분이 자연스럽지 않을 때가 있음)
                        //! AnimatedOpacity : 불투명도 변경에 애니메이션 효과
                        //! AnimatedPositioned : 위치 변경에 애니메이션 효과
                        //! AnimatedAlign : 정렬위치 변경에 애니메이션 효과
                        //! AnimatedDefaultTextStyle : 텍스트 스타일 변경에 애니메이션 효과
                        //! Hero : 두 화면 간의 전환 시 애니메이션을 적용
                        //! AnimatedCrossFade : 두 위젯간에 전환에 애니메이션 효과
                        //! AnimatedSwitcher: 기존 위젯이 제거되고 새로운 위젯이 추가될 때 애니메이션을 적용합니다. (여러 위젯 가능)
                        child: AnimatedSwitcher(
                          //! 지속 시간
                          duration: const Duration(milliseconds: 280),

                          //! 애니메이션 전환 효과를 정의하는 빌더 (기본적으로 페이드 인-아웃 효과)
                          transitionBuilder:
                              (Widget child, Animation<double> animation) {
                            //! ScaleTransition, FadeTransition, SlideTransition 등 다양한 전환 효과
                            return FadeTransition(
                              //! opacity을 직접 설정 X -> AnimatedSwitcher가 적절한 값을 제공(animation)
                              opacity: animation,
                              child: child,
                            );
                          },
                          //! 두가지 위젯을 변환
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
                          duration: const Duration(milliseconds: 280),
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
                  eventTypeButton ? "No Upcoming Event" : "No Past Events",
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

            //* 이벤트 더보기 버튼
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 33.h),
                child: GestureDetector(
                  onTap: () {
                    context.pushNamed("seeAllEvents");
                  },
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
                              "EXPLORE EVENTS",
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
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: AppColors.blueColors[1],
                                  borderRadius: BorderRadius.circular(15.h),
                                ),
                                child: Image.asset(
                                  "assets/icons/Shape.png",
                                  width: 13.w,
                                  height: 13.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          )
                        ],
                      )),
                ),
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
