import 'package:event_book_app/config/styles.dart';
import 'package:event_book_app/presentation/widgets/appbar_custom.dart';
import 'package:event_book_app/presentation/widgets/custom_button.dart';
import 'package:event_book_app/presentation/widgets/custom_text_field.dart';
import 'package:event_book_app/presentation/widgets/social_login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwController = TextEditingController();
  final TextEditingController pwconfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColors[0],
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const AppbarCustom(),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              width: 317.w,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Sign up",
                      style: TextStyles.title1,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomTextField(
                    imagePath: "assets/icons/Profile.png",
                    textEditingController: nameController,
                    hint: "Full name",
                  ),
                  SizedBox(
                    height: 19.h,
                  ),
                  CustomTextField(
                    imagePath: "assets/icons/mail.png",
                    textEditingController: emailController,
                    hint: "abc@email.com",
                  ),
                  SizedBox(
                    height: 19.h,
                  ),
                  CustomTextField(
                    imagePath: "assets/icons/password.png",
                    textEditingController: pwController,
                    hint: "Your password",
                    isPw: true,
                  ),
                  SizedBox(
                    height: 19.h,
                  ),
                  CustomTextField(
                    imagePath: "assets/icons/password.png",
                    textEditingController: pwconfirmController,
                    hint: "Confirm password",
                    isPw: true,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  CustomButton(
                    title: "Sign up",
                    onTap: () {
                      context.goNamed("signin");
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "OR",
                    style: TextStyles.text2.copyWith(
                      color: AppColors.greyColors[6],
                      height: 34 / 16,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  const SocialLoginButton(),
                  SizedBox(
                    height: 17.h,
                  ),

                  //* 페이스북 로그인
                  const SocialLoginButton(
                    isGoogle: false,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?  ",
                        style: TextStyles.text1,
                      ),
                      GestureDetector(
                        onTap: () {
                          context.goNamed("signin");
                        },
                        child: Text(
                          "Signin",
                          style: TextStyles.text1.copyWith(
                            color: AppColors.blueColors[0],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
