import 'package:event_book_app/config/styles.dart';
import 'package:event_book_app/presentation/pages/home/widgets/home_event_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeEventList extends StatelessWidget {
  const HomeEventList({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
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
            ],
          ),
        ),
      ],
    );
  }
}
