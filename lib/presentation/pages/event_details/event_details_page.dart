import 'package:event_book_app/config/styles.dart';
import 'package:event_book_app/presentation/pages/event_details/widgets/bottom_gradient.dart';
import 'package:event_book_app/presentation/pages/event_details/widgets/event_detail_body.dart';
import 'package:event_book_app/presentation/pages/event_details/widgets/event_detail_invite.dart';
import 'package:event_book_app/presentation/widgets/appbar_custom.dart';
import 'package:event_book_app/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventDetailsPage extends StatelessWidget {
  const EventDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColors[0],
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          //* 바디 부분
          const EventDetailBody(),

          //* 디테일 화면 상단 이미지
          Image.asset(
            "assets/images/detail_image.png",
            width: MediaQuery.of(context).size.width,
          ),

          //* 친구 목록? & 초대버튼
          const EventDetailInvite(),

          //* 앱 바
          Padding(
            padding: EdgeInsets.only(top: 48.h),
            child: const AppbarCustom(
              title: "Event Details",
              isBookMarkIcon: true,
              isBlackColor: false,
            ),
          ),

          //* 하단 그라데이션
          const BottomGradient(),

          CustomButton(
            title: "Buy Ticket \$120",
            onTap: () {},
            bottomPadding: 23.h,
          )
        ],
      ),
    );
  }
}
