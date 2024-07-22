import 'package:event_book_app/config/styles.dart';
import 'package:event_book_app/presentation/pages/signin/widgets/remember_forgot_component.dart';
import 'package:event_book_app/presentation/widgets/custom_button.dart';
import 'package:event_book_app/presentation/widgets/custom_text_field.dart';
import 'package:event_book_app/presentation/widgets/social_login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwController = TextEditingController();
  bool isSwitched = true;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    pwController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteColors[0],
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 29.h,
                  ),
                  Image.asset(
                    "assets/icons/main_logo.png",
                    width: 55.55.w,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 7.82.h,
                  ),
                  Text(
                    "EventHub",
                    style: TextStyles.title5,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  SizedBox(
                    width: 317.w,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Sign in",
                            style: TextStyles.title1,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),

                        //*  이메일 텍스트 필드
                        CustomTextField(
                          imagePath: "assets/icons/mail.png",
                          textEditingController: emailController,
                          hint: "abc@email.com",
                        ),
                        SizedBox(
                          height: 19.h,
                        ),

                        //* 비밀번호 텍스트 필드
                        CustomTextField(
                          imagePath: "assets/icons/password.png",
                          textEditingController: pwController,
                          isPw: true,
                          hint: "Your password",
                        ),
                        SizedBox(
                          height: 22.h,
                        ),

                        //* remember me | forgot Password
                        RememberForgotComponent(
                          isSwitched: isSwitched,
                          ontap: () {
                            setState(() {
                              isSwitched = !isSwitched;
                            });
                          },
                        ),
                        SizedBox(
                          height: 36.h,
                        ),

                        //* 로그인 버튼
                        CustomButton(
                          title: "Sign in",
                          onTap: () {
                            context.pushNamed("verification");
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

                        //* 구글 로그인
                        const SocialLoginButton(),
                        SizedBox(
                          height: 17.h,
                        ),

                        //* 페이스북 로그인
                        const SocialLoginButton(
                          isGoogle: false,
                        ),
                        SizedBox(
                          height: 17.h,
                        ),

                        //* 하단 회원가입 부분
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don’t have an account?  ",
                              style: TextStyles.text1,
                            ),
                            GestureDetector(
                              onTap: () {
                                context.pushNamed("signup");
                              },
                              child: Text(
                                "Sign up",
                                style: TextStyles.text1.copyWith(
                                  color: AppColors.blueColors[0],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
