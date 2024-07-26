import 'package:event_book_app/config/constants.dart';
import 'package:event_book_app/config/styles.dart';
import 'package:event_book_app/presentation/bloc/bloc/home_menu_bloc.dart';
import 'package:event_book_app/presentation/pages/home/widgets/home_event_list.dart';
import 'package:event_book_app/presentation/pages/home/widgets/invite_friend_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({
    super.key,
  });

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
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
    return BlocListener<HomeMenuBloc, HomeMenuState>(
      listener: (context, state) {
        if (state.isMenu) {
          _scrollToStart();
        }
      },
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            SizedBox(
              height: (185 + 39).h,
            ),

            //* Upcoming Events 리스트 부분
            const HomeEventList(
              title: "Upcoming Events",
            ),
            SizedBox(
              height: 29.h,
            ),

            //* Invite your friends 박스
            const InviteFriendBox(),
            SizedBox(
              height: 24.h,
            ),

            //* Nearby You 리스트 부분
            const HomeEventList(
              title: "Nearby You",
            ),
            SizedBox(
              height: 24.h,
            ),

            //* Nearby You 리스트 부분
            const HomeEventList(
              title: "Play Sports",
            ),
            SizedBox(
              height: 130.h,
            ),
          ],
        ),
      ),
    );
  }
}
