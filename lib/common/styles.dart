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
}

abstract class AppColors {
  //* 하얀색
  static const whiteColors = [
    Color(0xffffffff),
  ];

  //* 검정색
  static const blackColors = [
    Color(0xff120D26),
    Color(0xff000000),
  ];

  //* 회색
  static const greyColors = [
    Color(0xff9B9B9B),
    Color(0xff747688),
  ];

  //* 회색
  static const blueColors = [
    Color(0xff5669FF),
    Color(0xff3D56F0),
  ];
}
