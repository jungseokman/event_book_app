import 'package:event_book_app/config/constants.dart';
import 'package:event_book_app/config/styles.dart';
import 'package:event_book_app/presentation/bloc/home_menu/home_menu_bloc.dart';
import 'package:event_book_app/presentation/pages/home/widgets/bottom_sheet_component.dart';
import 'package:event_book_app/presentation/pages/home/widgets/home_appbar.dart';
import 'package:event_book_app/presentation/pages/home/widgets/home_body.dart';
import 'package:event_book_app/presentation/pages/home/widgets/home_first_shadow.dart';
import 'package:event_book_app/presentation/pages/home/widgets/home_second_shadow.dart';
import 'package:event_book_app/presentation/pages/home/widgets/left_back_menu.dart';
import 'package:event_book_app/presentation/pages/home/widgets/top_menu_lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    bool menuState = context.watch<HomeMenuBloc>().state.isMenu;

    return Scaffold(
        backgroundColor: AppColors.whiteColors[0],
        body: Stack(
          children: [
            //* 홈 화면 뒤 왼쪽 메뉴
            LeftBackMenu(menuState: menuState),

            //* 홈 화면 두번째 그림자
            HomeSecondShadow(menuState: menuState),

            //* 홈 화면 첫번째 그림자
            HomeFirstShadow(menuState: menuState),

            //* 홈 화면 - 메뉴버튼 클릭 시 애니메이션 효과
            AnimatedPositioned(
              top: 0,
              bottom: 0,
              left: menuState ? 257.w : 0,
              right: menuState ? -257.w : 0,
              duration:
                  const Duration(milliseconds: Constants.homeMenuAniDuration),
              child: AnimatedScale(
                duration:
                    const Duration(milliseconds: Constants.homeMenuAniDuration),
                scale: menuState ? 315 / 375 : 1,
                child: AnimatedContainer(
                  duration: const Duration(
                      milliseconds: Constants.homeMenuAniDuration),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      color: AppColors.whiteColors[0],
                      borderRadius:
                          BorderRadius.circular(menuState ? 40.h : 0)),
                  child: const Stack(
                    children: [
                      //* 본문 (SingleChildScrollView)
                      HomeBody(),

                      //* 상단 앱바
                      HomeAppbar(),

                      //* 상단 수평 메뉴 리스트
                      TopMenuLists(),

                      //* 하단 메뉴
                      BottomSheetComponent(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
