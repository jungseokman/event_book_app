import 'package:event_book_app/config/constants.dart';
import 'package:event_book_app/config/styles.dart';
import 'package:event_book_app/presentation/bloc/home_menu/home_menu_bloc.dart';
import 'package:event_book_app/presentation/pages/home/widgets/left_menu_cpmponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LeftBackMenu extends StatelessWidget {
  const LeftBackMenu({
    super.key,
    required this.menuState,
  });

  final bool menuState;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: AppColors.whiteColors[0],
      child: Stack(
        children: [
          AnimatedPositioned(
            left: menuState ? 0 : -180.w,
            right: menuState ? 0 : 180.w,
            duration:
                const Duration(milliseconds: Constants.homeMenuAniDuration),
            child: AnimatedOpacity(
              duration:
                  const Duration(milliseconds: Constants.homeMenuAniDuration),
              opacity: menuState ? 1 : 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 25.w,
                      top: 45.28.h,
                    ),
                    child: Image.asset(
                      "assets/icons/man.png",
                      width: 60.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 26.w,
                      top: 12.44.h,
                    ),
                    child: Text(
                      "Ashfak Sayem",
                      style: TextStyles.title6,
                    ),
                  ),
                  SizedBox(
                    height: 48.28.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 31.w),
                    child: Column(
                      children: [
                        const LeftMenuComponent(
                          icon: "assets/icons/profile_icon.png",
                          text: "My Profile",
                        ),
                        const LeftMenuComponent(
                          icon: "assets/icons/message_icon.png",
                          text: "Massage",
                          isSizedBoxWidth: false,
                        ),
                        const LeftMenuComponent(
                          icon: "assets/icons/calender_icon.png",
                          text: "Calender",
                        ),
                        const LeftMenuComponent(
                          icon: "assets/icons/bookmark_icon.png",
                          text: "Bookmark",
                        ),
                        const LeftMenuComponent(
                          icon: "assets/icons/contact_icon.png",
                          text: "Contact Us",
                        ),
                        const LeftMenuComponent(
                          icon: "assets/icons/setting_icon.png",
                          text: "Settings",
                        ),
                        const LeftMenuComponent(
                          icon: "assets/icons/help_icon.png",
                          text: "Helps & FAQs",
                        ),
                        LeftMenuComponent(
                          icon: "assets/icons/logout_icon.png",
                          text: "Sign Out",
                          onTap: () {
                            context
                                .read<HomeMenuBloc>()
                                .add(const ChangeHomeMenuEvent());
                            context.goNamed("signin");
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedPositioned(
            left: menuState ? 26.w : -154.w,
            bottom: 35.39.h,
            duration:
                const Duration(milliseconds: Constants.homeMenuAniDuration),
            child: AnimatedOpacity(
              opacity: menuState ? 1 : 0,
              duration:
                  const Duration(milliseconds: Constants.homeMenuAniDuration),
              child: Container(
                width: 150.w,
                height: 46.h,
                decoration: BoxDecoration(
                  color: AppColors.blueColors[11].withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8.h),
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icons/upgrade.png",
                      width: 21.07.w,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      width: 11.w,
                    ),
                    Text(
                      "Upgrade Pro",
                      style: TextStyles.title7
                          .copyWith(color: AppColors.blueColors[11]),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
