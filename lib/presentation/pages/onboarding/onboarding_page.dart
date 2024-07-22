import 'package:event_book_app/config/styles.dart';
import 'package:event_book_app/presentation/pages/onboarding/widgets/bottom_buttons.dart';
import 'package:event_book_app/presentation/pages/onboarding/widgets/bottom_title.dart';
import 'package:event_book_app/presentation/pages/onboarding/widgets/onboarding_image_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int onboardingType = 1;

  void nextHandler() {
    if (onboardingType == 1) {
      onboardingType = 2;
    } else if (onboardingType == 2) {
      onboardingType = 3;
    } else {
      context.goNamed("signin");
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColors[0],
      body: Stack(
        children: [
          //* 이미지 부분 컨테이너
          OnboardingImageContainer(onboardingType: onboardingType),

          //* 하단 파란 부분 컨테이너
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 288.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(48.h),
                  topRight: Radius.circular(48.h),
                ),
                color: AppColors.blueColors[0],
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 40.h,
                  ),

                  //* 하단 타이틀
                  BottomTitle(onboardingType: onboardingType),
                  SizedBox(
                    height: 16.h,
                  ),

                  //* 하단 텍스트
                  Text(
                    'In publishing and graphic design, Lorem is',
                    style: TextStyles.text1.copyWith(
                        color: AppColors.whiteColors[0].withOpacity(0.8)),
                  ),
                  Text(
                    ' a placeholder text commonly',
                    style: TextStyles.text1.copyWith(
                        color: AppColors.whiteColors[0].withOpacity(0.8)),
                  ),
                  SizedBox(
                    height: 43.h,
                  ),

                  //* 하단 skip ~ next 버튼들.
                  BottomButtons(
                    onboardingType: onboardingType,
                    onTap: nextHandler,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
