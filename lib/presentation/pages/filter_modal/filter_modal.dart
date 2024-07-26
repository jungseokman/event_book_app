import 'package:event_book_app/config/styles.dart';
import 'package:event_book_app/presentation/pages/filter_modal/widgets/date_button.dart';
import 'package:event_book_app/presentation/pages/filter_modal/widgets/filter_location.dart';
import 'package:event_book_app/presentation/pages/filter_modal/widgets/filter_type_button.dart';
import 'package:event_book_app/presentation/pages/filter_modal/widgets/select_price_range.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterModal extends StatefulWidget {
  const FilterModal({
    super.key,
  });

  @override
  State<FilterModal> createState() => _FilterModalState();
}

class _FilterModalState extends State<FilterModal> {
  List<int> focusfilterType = [];
  int focusButton = 0;

  //? 필터 버튼 클릭 함수
  void clickFilterTypeButton(int number) {
    if (focusfilterType.contains(number)) {
      focusfilterType.remove(number);
    } else {
      focusfilterType.add(number);
    }
    setState(() {});
  }

  void clickDateButton(int number) {
    if (focusButton == number) {
      focusButton = 0;
    } else {
      focusButton = number;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 741.h,
      decoration: BoxDecoration(
        color: AppColors.whiteColors[0],
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(38.w),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 12.h,
          ),
          Container(
            width: 26.w,
            height: 5.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.5.h),
              color: AppColors.greyColors[3].withOpacity(0.5),
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Text(
                  "Filter",
                  style: TextStyles.title8,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),

              //* 상단 버튼 리스트
              _filterButtonList(),
              SizedBox(
                height: 26.97.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //* Time & Date
                    _timeAndDateComponent(),
                    SizedBox(
                      height: 26.h,
                    ),

                    //* 위치 컴포넌트
                    const FilterLocation(),
                    SizedBox(
                      height: 24.h,
                    ),

                    //* 가격 범위 고르는 곳
                    const SelectPriceRange(),

                    SizedBox(
                      height: 34.h,
                    ),

                    //* 하단 버튼
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 130.w,
                          height: 58.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14.h),
                            border: Border.all(color: AppColors.greyColors[12]),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "Reset",
                            style: TextStyles.title9,
                          ),
                        ),
                        Container(
                          width: 185.w,
                          height: 58.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14.h),
                            color: AppColors.blueColors[0],
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "Apply",
                            style: TextStyles.title9
                                .copyWith(color: AppColors.whiteColors[0]),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  ////////////////////////////////////////////////?
  //////////////////? 메서드 ///////////////////////
  ////////////////////?//////////////////////////?
  //* Time & Date
  Column _timeAndDateComponent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Time & Date",
          style: TextStyles.text10,
        ),
        SizedBox(
          height: 12.h,
        ),
        Row(
          children: [
            DateButton(
              focusButton: focusButton,
              text: "Today",
              buttonNumber: 1,
              onTap: () {
                clickDateButton(1);
              },
            ),
            SizedBox(
              width: 12.w,
            ),
            DateButton(
              focusButton: focusButton,
              text: "Tomorrow",
              buttonNumber: 2,
              onTap: () {
                clickDateButton(2);
              },
            ),
            SizedBox(
              width: 12.w,
            ),
            DateButton(
              focusButton: focusButton,
              text: "This week",
              buttonNumber: 3,
              onTap: () {
                clickDateButton(3);
              },
            ),
          ],
        ),
        SizedBox(
          height: 14.h,
        ),
        Container(
          width: 241.w,
          height: 42.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.h),
            border: Border.all(color: AppColors.greyColors[14]),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 14.w,
              ),
              Image.asset(
                "assets/icons/Calendar_color.png",
                width: 21.w,
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: 13.w,
              ),
              Text(
                'Choose from calender',
                style: TextStyles.text1.copyWith(
                  color: AppColors.greyColors[13],
                ),
              ),
              SizedBox(
                width: 12.w,
              ),
              Image.asset(
                "assets/icons/arrow_right_color.png",
                height: 9.h,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ],
    );
  }

  //* 상단 버튼 리스트
  SizedBox _filterButtonList() {
    return SizedBox(
      height: 97.03.h,
      child: Row(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                FilterTypeButton(
                  focusfilterType: focusfilterType,
                  whatfilterType: 1,
                  image: "assets/icons/ball_icon.png",
                  text: "Sports",
                  onTap: () {
                    clickFilterTypeButton(1);
                  },
                ),
                FilterTypeButton(
                  focusfilterType: focusfilterType,
                  whatfilterType: 2,
                  image: "assets/icons/music_icon.png",
                  text: "Music",
                  onTap: () {
                    clickFilterTypeButton(2);
                  },
                ),
                FilterTypeButton(
                  focusfilterType: focusfilterType,
                  whatfilterType: 3,
                  image: "assets/icons/art_icon.png",
                  text: "Art",
                  onTap: () {
                    clickFilterTypeButton(3);
                  },
                ),
                FilterTypeButton(
                  focusfilterType: focusfilterType,
                  whatfilterType: 4,
                  image: "assets/icons/food_icon.png",
                  text: "Food",
                  onTap: () {
                    clickFilterTypeButton(4);
                  },
                ),
                FilterTypeButton(
                  focusfilterType: focusfilterType,
                  whatfilterType: 5,
                  image: "assets/icons/ball_icon.png",
                  text: "Sports",
                  onTap: () {
                    clickFilterTypeButton(5);
                  },
                ),
                FilterTypeButton(
                  focusfilterType: focusfilterType,
                  whatfilterType: 6,
                  image: "assets/icons/music_icon.png",
                  text: "Music",
                  onTap: () {
                    clickFilterTypeButton(6);
                  },
                  isRightPadding: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
