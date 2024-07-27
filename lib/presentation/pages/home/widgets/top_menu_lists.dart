import 'package:event_book_app/config/constants.dart';
import 'package:event_book_app/config/styles.dart';
import 'package:event_book_app/presentation/bloc/home_menu/home_menu_bloc.dart';
import 'package:event_book_app/presentation/pages/home/widgets/top_menu_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopMenuLists extends StatefulWidget {
  const TopMenuLists({
    super.key,
  });

  @override
  State<TopMenuLists> createState() => _TopMenuListsState();
}

class _TopMenuListsState extends State<TopMenuLists> {
  final ScrollController _scrollController = ScrollController();

  void _scrollToStart() {
    _scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: Constants.homeMenuAniDuration),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: (185 - (39.42 / 2)).h,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 39.42.h,
                child: BlocListener<HomeMenuBloc, HomeMenuState>(
                  listener: (context, state) {
                    if (state.isMenu) {
                      _scrollToStart();
                    }
                  },
                  child: ListView(
                    controller: _scrollController,
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    scrollDirection: Axis.horizontal,
                    clipBehavior: Clip.none,
                    children: [
                      TopMenuList(
                        imagePath: "assets/icons/menu1.png",
                        text: "Sports",
                        bgColor: AppColors.redColor[0],
                      ),
                      SizedBox(
                        width: 11.28.w,
                      ),
                      TopMenuList(
                        imagePath: "assets/icons/menu2.png",
                        text: "Music",
                        bgColor: AppColors.redColor[1],
                      ),
                      SizedBox(
                        width: 11.28.w,
                      ),
                      TopMenuList(
                        imagePath: "assets/icons/menu3.png",
                        text: "Food",
                        bgColor: AppColors.greenColor[0],
                      ),
                      SizedBox(
                        width: 11.28.w,
                      ),
                      TopMenuList(
                        imagePath: "assets/icons/bell.png",
                        text: "Bell",
                        bgColor: AppColors.blueColors[8],
                      ),
                      SizedBox(
                        width: 11.28.w,
                      ),
                      TopMenuList(
                        imagePath: "assets/icons/menu1.png",
                        text: "Soccer",
                        bgColor: AppColors.purpleColor[1],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
