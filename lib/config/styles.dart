import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  //* 전체 글꼴
  static final _font1 = GoogleFonts.roboto();

  //* 타이틀 텍스트 스타일
  static TextStyle get title1 => _font1.copyWith(
        color: AppColors.blackColors[0],
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get title2 => _font1.copyWith(
        color: AppColors.blackColors[0],
        fontSize: 15.sp,
        fontWeight: FontWeight.bold,
        height: 1.3,
      );

  static TextStyle get title3 => _font1.copyWith(
        color: AppColors.whiteColors[0],
        fontSize: 22.sp,
        fontWeight: FontWeight.bold,
        height: 34 / 22,
      );

  static TextStyle get title4 => _font1.copyWith(
        color: AppColors.whiteColors[0],
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get title5 => _font1.copyWith(
        color: AppColors.blackColors[2],
        fontSize: 35.sp,
        fontWeight: FontWeight.bold,
      );

  //* 기본 텍스트 스타일
  static TextStyle get text1 => _font1.copyWith(
        color: AppColors.blackColors[0],
        fontSize: 15.sp,
        height: 25 / 15,
      );

  static TextStyle get text2 => _font1.copyWith(
        color: AppColors.greyColors[1],
        fontSize: 16.sp,
        height: 25 / 16,
      );

  static TextStyle get text3 => _font1.copyWith(
        color: AppColors.blueColors[0],
        fontSize: 13.sp,
      );

  static TextStyle get text4 => _font1.copyWith(
        color: AppColors.blackColors[0],
        fontSize: 24.sp,
        height: 1.1,
      );

  static TextStyle get text5 => _font1.copyWith(
        color: AppColors.whiteColors[0],
        fontSize: 12.sp,
      );

  static TextStyle get text6 => _font1.copyWith(
        color: AppColors.blackColors[0],
        fontSize: 14.sp,
        height: 23 / 14,
      );

  static TextStyle get text7 => _font1.copyWith(
        color: AppColors.whiteColors[1],
        fontSize: 13.sp,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get text8 => _font1.copyWith(
        color: AppColors.whiteColors[0],
        fontSize: 20.33.sp,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get text9 => _font1.copyWith(
        color: AppColors.whiteColors[0],
        fontSize: 10.sp,
        fontWeight: FontWeight.w500,
      );
}

abstract class AppColors {
  //* 하얀색
  static const whiteColors = [
    Color(0xffffffff),
    Color(0xffF4F4FE),
  ];

  //* 검정색
  static const blackColors = [
    //? 0 ~ 2
    Color(0xff120D26),
    Color(0xff000000),
    Color(0xff37364A),

    //? 3 ~ 5
    Color(0xff2E2E4F),
    Color(0xff505588),
    Color(0xff484D70),
  ];

  //* 회색
  static const greyColors = [
    //? 0 ~ 2
    Color(0xff9B9B9B),
    Color(0xff747688),
    Color(0xffB0B1BC),

    //? 3 ~ 5
    Color(0xffB2B2B2),
    Color(0xffE4DFDF),
    Color(0xff979797),

    //? 6 ~ 8
    Color(0xff9D9898),
    Color(0xffDADADA),
    Color(0xff9DB2D6),

    //? 9 ~ 11
    Color(0xffd2cfd6),
  ];

  //* 파란색
  static const blueColors = [
    //? 0 ~ 2
    Color(0xff5669FF),
    Color(0xff3D56F0),
    Color(0xff575C8A),

    //? 3 ~ 5
    Color(0xff7974E7),
    Color(0xff4A43EC),
    Color(0xff524CE0),

    //? 6 ~ 8
    Color(0xff02E9FE),
    Color(0xff5D56F3),
    Color(0xff46CDFB),

    //? 9 ~ 11
    Color(0xff3F38DD),
    Color(0xffd6feff),
    Color(0xff00F8FF),

    //? 12 ~ 14
    Color(0xffABC2EB),
  ];

  static const purpleColor = [
    //? 0 ~ 2
    Color(0xff7974E7),
    Color(0xffA29EF0),
  ];

  static const redColor = [
    //? 0 ~ 2
    Color(0xffF0635A),
    Color(0xffF59762),
  ];

  static const greenColor = [
    //? 0 ~ 2
    Color(0xff29D697),
  ];
}
