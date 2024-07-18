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

  //* 기본 텍스트 스타일
  static TextStyle get text1 => _font1.copyWith(
        color: AppColors.blackColors[0],
        fontSize: 15.sp,
        height: (25 / 15).h,
      );

  static TextStyle get text2 => _font1.copyWith(
        color: AppColors.greyColors[1],
        fontSize: 16.sp,
        height: (25 / 16).h,
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
}

abstract class AppColors {
  //* 하얀색
  static const whiteColors = [
    Color(0xffffffff),
  ];

  //* 검정색
  static const blackColors = [
    //? 0 ~ 2
    Color(0xff120D26),
    Color(0xff000000),
  ];

  //* 회색
  static const greyColors = [
    //? 0 ~ 2
    Color(0xff9B9B9B),
    Color(0xff747688),
    Color(0xffB0B1BC),

    //? 3 ~ 5
    Color(0xffB2B2B2),
  ];

  //* 파란색
  static const blueColors = [
    //? 0 ~ 2
    Color(0xff5669FF),
    Color(0xff3D56F0),
    Color(0xff575C8A),

    //? 3 ~ 5
    Color(0xff7974E7),
  ];
}