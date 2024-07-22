import 'package:event_book_app/config/styles.dart';
import 'package:event_book_app/presentation/widgets/appbar_custom.dart';
import 'package:event_book_app/presentation/widgets/custom_button.dart';
import 'package:event_book_app/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RessetPasswordPage extends StatefulWidget {
  const RessetPasswordPage({super.key});

  @override
  State<RessetPasswordPage> createState() => _RessetPasswordPageState();
}

class _RessetPasswordPageState extends State<RessetPasswordPage> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColors[0],
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Resset Password",
                            style: TextStyles.title1,
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          Text(
                            "Please enter your email address to",
                            style: TextStyles.text1,
                          ),
                          Text(
                            "request a password reset",
                            style: TextStyles.text1,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 27.h,
                    ),
                    CustomTextField(
                      imagePath: "assets/icons/mail.png",
                      textEditingController: controller,
                      hint: "abc@email.com",
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    CustomButton(
                        title: "send",
                        onTap: () {
                          context.goNamed("signin");
                        })
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
