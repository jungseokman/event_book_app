import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingImageContainer extends StatelessWidget {
  const OnboardingImageContainer({
    super.key,
    required this.onboardingType,
  });

  final int onboardingType;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 264.h,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (child, animation) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        child: onboardingType == 1
            ? Image.asset(
                "assets/images/onboarding1.png",
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
                key: const ValueKey<int>(1),
              )
            : onboardingType == 2
                ? Padding(
                    key: const ValueKey<int>(2),
                    padding: EdgeInsets.only(bottom: 8.h),
                    child: Image.asset(
                      "assets/images/onboarding2.png",
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                  )
                : Padding(
                    key: const ValueKey<int>(3),
                    padding: EdgeInsets.only(bottom: 8.h),
                    child: Image.asset(
                      "assets/images/onboarding3.png",
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                  ),
      ),
    );
  }
}
