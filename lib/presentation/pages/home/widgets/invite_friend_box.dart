import 'package:event_book_app/config/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InviteFriendBox extends StatelessWidget {
  const InviteFriendBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 328.w,
      height: 127.h,
      decoration: BoxDecoration(
        color: AppColors.blueColors[10],
        borderRadius: BorderRadius.circular(12.h),
        boxShadow: [
          BoxShadow(
            blurRadius: 50,
            offset: Offset(0, 5.h),
            color: AppColors.blueColors[12].withOpacity(0.03),
          )
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            left: 116.w,
            top: -7.h,
            child: Image.asset(
              "assets/images/invite_friend.png",
              width: 263.w,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              left: 18.w,
              top: 13.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Invite your friends",
                    style: TextStyles.title4.copyWith(
                      color: AppColors.blackColors[0],
                      height: 34 / 18,
                    ),
                  ),
                  Text(
                    "Get \$20 for ticket",
                    style: TextStyles.text3
                        .copyWith(color: AppColors.blackColors[5]),
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  Container(
                    width: 72.w,
                    height: 32.h,
                    decoration: BoxDecoration(
                      color: AppColors.blueColors[11],
                      borderRadius: BorderRadius.circular(5.h),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Invite",
                      style: TextStyles.text5.copyWith(
                        fontWeight: FontWeight.w900,
                        height: 23 / 12,
                      ),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
