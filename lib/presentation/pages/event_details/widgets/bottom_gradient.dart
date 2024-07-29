import 'package:event_book_app/config/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomGradient extends StatelessWidget {
  const BottomGradient({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 175.h,
        child: Column(
          children: [
            Container(
              height: (175 * 0.60).h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.whiteColors[0].withOpacity(0),
                    AppColors.whiteColors[0].withOpacity(1),
                  ],
                ),
              ),
            ),
            Container(
              height: (175 * 0.40).h,
              color: AppColors.whiteColors[0],
            )
          ],
        ),
      ),
    );
  }
}
