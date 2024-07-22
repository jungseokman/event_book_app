import 'dart:async';

import 'package:event_book_app/config/styles.dart';
import 'package:event_book_app/presentation/pages/verification/widgets/one_number_text_field.dart';
import 'package:event_book_app/presentation/widgets/appbar_custom.dart';
import 'package:event_book_app/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final FocusNode focusNode3 = FocusNode();
  final FocusNode focusNode4 = FocusNode();
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();
  final TextEditingController controller4 = TextEditingController();
  int _seconds = 20;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    //? 처음에 첫번쨰 텍스트필드에 포커스
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(focusNode1);
    });

    //? 20초 부터 1초씩 줄어드는 타이머 -> 0초때 뒤로가기 발동
    startTimer();

    //? 삭제버튼 감지하여 포커스 이전으로 이동 (4번째칸은 1번 클릭 시 숫자 삭제, 2번째 클릭 시 이번 칸으로 이동, 삭제)
    focusNode2.addListener(_handleFocusNode2Event);
    focusNode3.addListener(_handleFocusNode3Event);
    focusNode4.addListener(_handleFocusNode4Event);

    //? 글자가 입력되면 다음 칸으로 포커스 이동
    controller1.addListener(_handleController1Event);
    controller2.addListener(_handleController2Event);
    controller3.addListener(_handleController3Event);
  }

  //? 삭제버튼을 감지하여 처리하는 함수 (에뮬에서는 작동x, pc에서는 작동하여 실제 디바이스에서 작동하는지 체크요망)
  bool _handleKeyEvent(KeyEvent event) {
    if (event is KeyDownEvent &&
        event.logicalKey == LogicalKeyboardKey.backspace) {
      if (focusNode2.hasFocus) {
        controller1.clear();

        FocusScope.of(context).requestFocus(focusNode1);
      }
      if (focusNode3.hasFocus) {
        controller2.clear();

        FocusScope.of(context).requestFocus(focusNode2);
      }
      if (focusNode4.hasFocus) {
        if (controller4.text.isNotEmpty) {
          controller4.clear();
        } else {
          controller3.clear();
          FocusScope.of(context).requestFocus(focusNode3);
        }
      }
      return true;
    }
    return false;
  }

  void _handleFocusNode2Event() {
    if (focusNode2.hasFocus) {
      HardwareKeyboard.instance.addHandler(_handleKeyEvent);
    } else {
      HardwareKeyboard.instance.removeHandler(_handleKeyEvent);
    }
  }

  void _handleFocusNode3Event() {
    if (focusNode3.hasFocus) {
      HardwareKeyboard.instance.addHandler(_handleKeyEvent);
    } else {
      HardwareKeyboard.instance.removeHandler(_handleKeyEvent);
    }
  }

  void _handleFocusNode4Event() {
    if (focusNode4.hasFocus) {
      HardwareKeyboard.instance.addHandler(_handleKeyEvent);
    } else {
      HardwareKeyboard.instance.removeHandler(_handleKeyEvent);
    }
  }

  void _handleController1Event() {
    if (controller1.text.length == 1) {
      FocusScope.of(context).requestFocus(focusNode2);
    }
  }

  void _handleController2Event() {
    if (controller2.text.length == 1) {
      FocusScope.of(context).requestFocus(focusNode3);
    }
  }

  void _handleController3Event() {
    if (controller3.text.length == 1) {
      FocusScope.of(context).requestFocus(focusNode4);
    }
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }

      if (_seconds > 0) {
        setState(() {
          _seconds--;
        });
      } else {
        _timer?.cancel();
        if (context.canPop()) {
          context.pop();
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
    focusNode2.removeListener(_handleFocusNode2Event);
    focusNode3.removeListener(_handleFocusNode3Event);
    focusNode4.removeListener(_handleFocusNode4Event);
    controller1.removeListener(_handleController1Event);
    controller2.removeListener(_handleController2Event);
    controller3.removeListener(_handleController3Event);
    focusNode1.dispose();
    focusNode2.dispose();
    focusNode3.dispose();
    focusNode4.dispose();
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.whiteColors[0],
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
                          "Verification",
                          style: TextStyles.title1,
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Text(
                          "We’ve send you the verification",
                          style: TextStyles.text1,
                        ),
                        Text(
                          "code on +1 2620 0323 7631",
                          style: TextStyles.text1,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 27.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OneNumberTextField(
                        controller: controller1,
                        focusNode: focusNode1,
                      ),
                      OneNumberTextField(
                        controller: controller2,
                        focusNode: focusNode2,
                      ),
                      OneNumberTextField(
                        controller: controller3,
                        focusNode: focusNode3,
                      ),
                      OneNumberTextField(
                        controller: controller4,
                        focusNode: focusNode4,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  CustomButton(
                    title: "Continue",
                    onTap: () {
                      context.pushNamed("emptyEvents");
                    },
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Re-send code in  ",
                        style: TextStyles.text1,
                      ),
                      Text(
                        "0:${_seconds.toString().padLeft(2, '0')}",
                        style: TextStyles.text1.copyWith(
                          color: AppColors.blueColors[0],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
