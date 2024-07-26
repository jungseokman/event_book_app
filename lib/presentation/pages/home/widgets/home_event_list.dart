import 'package:event_book_app/config/constants.dart';
import 'package:event_book_app/config/styles.dart';
import 'package:event_book_app/presentation/bloc/bloc/home_menu_bloc.dart';
import 'package:event_book_app/presentation/pages/home/widgets/home_event_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeEventList extends StatefulWidget {
  const HomeEventList({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<HomeEventList> createState() => _HomeEventListState();
}

class _HomeEventListState extends State<HomeEventList> {
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
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: TextStyles.title4.copyWith(
                    color: AppColors.blackColors[0],
                    height: 34 / 18,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "See All",
                      style: TextStyles.text6.copyWith(
                        color: AppColors.greyColors[1],
                      ),
                    ),
                    SizedBox(
                      width: 5.29.w,
                    ),
                    Image.asset(
                      "assets/icons/right_arrow.png",
                      width: 6.43.w,
                      fit: BoxFit.cover,
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
            height: 255.h,
            child: ListView(
              controller: _scrollController,
              clipBehavior: Clip.none,
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              scrollDirection: Axis.horizontal,
              children: [
                const HomeEventComponent(
                  bgImage: "assets/images/home_event1.png",
                  title: "International Band Mu...",
                  location: "36 Guild Street London, UK",
                ),
                SizedBox(
                  width: 16.w,
                ),
                const HomeEventComponent(
                  bgImage: "assets/images/home_event2.png",
                  title: "Jo Malone London’s Mo..",
                  location: "Radius Gallery • Santa Cruz, CA",
                ),
                SizedBox(
                  width: 16.w,
                ),
                const HomeEventComponent(
                  bgImage: "assets/images/home_event1.png",
                  title: "International Band Mu...",
                  location: "36 Guild Street London, UK",
                ),
                SizedBox(
                  width: 16.w,
                ),
                const HomeEventComponent(
                  bgImage: "assets/images/home_event2.png",
                  title: "Jo Malone London’s Mo..",
                  location: "Radius Gallery • Santa Cruz, CA",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
