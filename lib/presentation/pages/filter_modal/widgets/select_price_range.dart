import 'dart:math';

import 'package:event_book_app/config/constants.dart';
import 'package:event_book_app/config/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectPriceRange extends StatefulWidget {
  const SelectPriceRange({
    super.key,
  });

  @override
  State<SelectPriceRange> createState() => _SelectPriceRangeState();
}

class _SelectPriceRangeState extends State<SelectPriceRange> {
  double _leftButtonPosition = 0;
  double _rightButtonPosition = 35.w;

  int minRange = 0;
  int maxRange = 1;
  List<int> randomNumberList = [];

  final random = Random();

  (double, int) _snapToClosestPosition(double position) {
    List<Map<double, double>> values = [];
    List<Map<double, int>> indexs = [];
    int index = 0;
    for (double i = 0; i <= 332.5.w; i = i + 17.5.w) {
      values.add({i: (position - i).abs()});
      indexs.add({i: index});
      ++index;
    }

    double closestKey = 0;
    double smallestValue = double.infinity;
    int selectIndex = 0;

    for (var map in values) {
      map.forEach((key, value) {
        if (value < smallestValue) {
          smallestValue = value;
          closestKey = key;
        }
      });
    }

    for (var idx in indexs) {
      if (idx.containsKey(closestKey)) {
        selectIndex = int.parse(idx[closestKey].toString());
      }
    }

    return (closestKey.toDouble(), selectIndex);
  }

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < 16; i++) {
      randomNumberList.add(3 + random.nextInt(7));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Select price range",
              style: TextStyles.text10,
            ),
            Text(
              "\$${minRange * 10} - \$${maxRange * 10}",
              style: TextStyles.text11,
            ),
          ],
        ),
        SizedBox(
          width: 332.5.w,
          height: 81.h,
          child: Stack(
            children: [
              Stack(
                children: List.generate(16, (index) {
                  return Positioned(
                    left: (17.5 * (index + 1) + (17.5 / 2)).w,
                    bottom: 16.h,
                    child: AnimatedContainer(
                      duration: const Duration(
                        milliseconds: 500,
                      ),
                      curve: Curves.fastOutSlowIn,
                      width: 17.5.w,
                      height: (minRange <= index && maxRange > index)
                          ? (6.8 * randomNumberList[index]).h
                          : 0,
                      decoration: BoxDecoration(
                          color: AppColors.greyColors[14],
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(9.w))),
                    ),
                  );
                }).toList(),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 16.h,
                child: Container(
                  height: 3.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(15.h),
                      color: AppColors.blueColors[0].withOpacity(0.2)),
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(
                  milliseconds: 50,
                ),
                curve: Curves.fastOutSlowIn,
                left: _leftButtonPosition,
                bottom: 16.h,
                child: AnimatedContainer(
                  duration: const Duration(
                    milliseconds: 50,
                  ),
                  curve: Curves.fastOutSlowIn,
                  width: _rightButtonPosition - _leftButtonPosition,
                  height: 3.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(15.h),
                      color: AppColors.blueColors[0]),
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(
                  milliseconds: 50,
                ),
                curve: Curves.fastOutSlowIn,
                left: _leftButtonPosition,
                bottom: 0,
                child: GestureDetector(
                  onHorizontalDragUpdate: (details) {
                    setState(() {
                      _leftButtonPosition += details.delta.dx;
                      if (_leftButtonPosition < 0) {
                        _leftButtonPosition = 0;
                      } else if (_leftButtonPosition >
                          _rightButtonPosition - 35.w) {
                        _leftButtonPosition = _rightButtonPosition - 35.w;
                      }
                    });
                  },
                  onHorizontalDragEnd: (details) {
                    _leftButtonPosition =
                        _snapToClosestPosition(_leftButtonPosition).$1;
                    minRange = _snapToClosestPosition(_leftButtonPosition).$2;
                    setState(() {});
                  },
                  child: Container(
                    width: 35.w,
                    height: 35.h,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.blueColors[0],
                      ),
                      borderRadius: BorderRadius.circular(9.w),
                      color: AppColors.whiteColors[0],
                    ),
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/icons/side_arrow.png",
                      width: 16.w,
                    ),
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(
                  milliseconds: 50,
                ),
                curve: Curves.fastOutSlowIn,
                left: _rightButtonPosition,
                bottom: 0,
                child: GestureDetector(
                  onHorizontalDragUpdate: (details) {
                    setState(() {
                      _rightButtonPosition += details.delta.dx;
                      if (_rightButtonPosition < _leftButtonPosition + 35.w) {
                        _rightButtonPosition = _leftButtonPosition + 35.w;
                      } else if (_rightButtonPosition > (332.5 - 35).w) {
                        _rightButtonPosition = (332.5 - 35).w;
                      }
                    });
                  },
                  onHorizontalDragEnd: (details) {
                    _rightButtonPosition =
                        _snapToClosestPosition(_rightButtonPosition).$1;
                    maxRange =
                        (_snapToClosestPosition(_rightButtonPosition).$2 - 1);
                    setState(() {});
                  },
                  child: Container(
                    width: 35.w,
                    height: 35.h,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.blueColors[0],
                      ),
                      borderRadius: BorderRadius.circular(9.w),
                      color: AppColors.whiteColors[0],
                    ),
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/icons/side_arrow.png",
                      width: 16.w,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
