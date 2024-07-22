import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:event_book_app/config/styles.dart';

class AppbarCustom extends StatelessWidget {
  const AppbarCustom({
    super.key,
    this.title = "",
    this.isSearchIcon = false,
    this.isMoreIcon = false,
  });

  final String title;
  final bool isSearchIcon;
  final bool isMoreIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      height: 36.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  if (context.canPop()) {
                    context.pop();
                  }
                },
                child: Image.asset(
                  "assets/icons/Back.png",
                  width: 22.w,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 11.w,
              ),
              Text(
                title,
                style: TextStyles.title1,
              ),
            ],
          ),
          Row(
            children: [
              isSearchIcon
                  ? GestureDetector(
                      onTap: () {
                        context.pushNamed("searchEvents");
                      },
                      child: Image.asset(
                        "assets/icons/search.png",
                        width: 24.w,
                        fit: BoxFit.cover,
                      ),
                    )
                  : const SizedBox(),
              SizedBox(
                width: 16.w,
              ),
              isMoreIcon
                  ? Image.asset(
                      "assets/icons/More.png",
                      width: 22.w,
                      fit: BoxFit.cover,
                    )
                  : const SizedBox(),
            ],
          ),
        ],
      ),
    );
  }
}
