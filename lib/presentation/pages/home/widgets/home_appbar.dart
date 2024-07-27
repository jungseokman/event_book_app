import 'package:event_book_app/config/constants.dart';
import 'package:event_book_app/config/styles.dart';
import 'package:event_book_app/presentation/bloc/home_menu/home_menu_bloc.dart';
import 'package:event_book_app/presentation/pages/filter_modal/filter_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool menuState = context.watch<HomeMenuBloc>().state.isMenu;

    return AnimatedContainer(
      duration: const Duration(milliseconds: Constants.homeMenuAniDuration),
      height: 185.h,
      decoration: BoxDecoration(
        color: AppColors.blueColors[4],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(33.h),
          bottomRight: Radius.circular(33.h),
          topLeft: Radius.circular(menuState ? 40.h : 0),
          topRight: Radius.circular(menuState ? 40.h : 0),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 50.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      context
                          .read<HomeMenuBloc>()
                          .add(const ChangeHomeMenuEvent());
                    },
                    child: Image.asset(
                      "assets/icons/menu.png",
                      width: 24.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Current Location",
                            style: TextStyles.text5.copyWith(
                                color:
                                    AppColors.whiteColors[0].withOpacity(0.7)),
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Image.asset(
                            "assets/icons/down_arrow.png",
                            width: 10.w,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "New Yourk, USA",
                        style: TextStyles.text7,
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: 36.w,
                    height: 36.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.whiteColors[0].withOpacity(0.1),
                    ),
                    child: Stack(
                      children: [
                        Center(
                          child: Image.asset(
                            "assets/icons/bell.png",
                            width: 15.w,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 7.h,
                          right: 8.w,
                          child: Container(
                            width: 9.w,
                            height: 9.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.blueColors[5],
                            ),
                            child: Container(
                              width: 5.w,
                              height: 5.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.blueColors[6],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            height: 32.14.h,
            alignment: Alignment.center,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/icons/search_white.png",
                  width: 24.w,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      isDense: true,
                      border: InputBorder.none,
                      hintText: " Search...",
                      hintStyle: TextStyles.text8.copyWith(
                        color: AppColors.whiteColors[0].withOpacity(0.3),
                      ),
                      contentPadding: EdgeInsets.zero,
                    ),
                    cursorHeight: 20.h,
                    cursorWidth: 1.5.w,
                    cursorColor: AppColors.purpleColor[0],
                    style: TextStyles.text8,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    //* 필터 바텀 모달
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) {
                        return const FilterModal();
                      },
                      transitionAnimationController: AnimationController(
                        duration: const Duration(milliseconds: 350),
                        vsync: Navigator.of(context),
                      ),
                    );
                  },
                  child: Container(
                    width: 75.w,
                    height: 32.14.h,
                    padding: EdgeInsets.only(left: 4.29.w, right: 7.36.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.h),
                      color: AppColors.blueColors[7],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          "assets/icons/filter.png",
                          width: 23.75.w,
                          fit: BoxFit.fill,
                          color: AppColors.purpleColor[1],
                        ),
                        Text(
                          "Filters",
                          style: TextStyles.text5,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
