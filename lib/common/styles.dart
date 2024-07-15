import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static final _font1 = GoogleFonts.nanumGothic();

  static TextStyle get title1 => _font1.copyWith(
        color: AppColors.darkColors[0],
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      );
}

abstract class AppColors {
  static const lightColors = [
    Color(0xffffffff),
  ];
  static const darkColors = [
    Color(0xff222222),
  ];
}
