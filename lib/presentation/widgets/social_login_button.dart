import 'package:event_book_app/config/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    super.key,
    this.isGoogle = true,
  });

  final bool isGoogle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 273.w,
      height: 56.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.whiteColors[0],
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColors[0].withOpacity(0.05),
            offset: const Offset(0, 3),
            blurRadius: 5,
            spreadRadius: 3,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            isGoogle ? "assets/icons/google.png" : "assets/icons/facebook.png",
            width: isGoogle ? 26.w : 30.79.w,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            isGoogle ? "Login with Google" : "Login with Facebook",
            style: TextStyles.text2.copyWith(
              color: AppColors.blackColors[0],
            ),
          )
        ],
      ),
    );
  }
}
