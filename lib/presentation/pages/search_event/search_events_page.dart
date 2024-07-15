import 'package:event_book_app/common/constants.dart';
import 'package:event_book_app/common/styles.dart';
import 'package:event_book_app/presentation/widgets/appbar_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchEventsPage extends StatefulWidget {
  const SearchEventsPage({super.key});

  @override
  State<SearchEventsPage> createState() => _SearchEventsPageState();
}

class _SearchEventsPageState extends State<SearchEventsPage> {
  final TextEditingController textEditingController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    //* 페이지가 로드될 때 텍스트 필드에 포커스를 줌
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  void dispose() {
    textEditingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColors[0],
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            //* 앱 바
            const AppbarDefault(title: "Search"),
            SizedBox(
              height: 30.h,
            ),

            //* 검색 및 필터버튼
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                children: [
                  Image.asset(
                    "assets/icons/search_blue.png",
                    width: 24.w,
                    height: 24.h,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 26.h,
                      child: TextField(
                        controller: textEditingController,
                        focusNode: _focusNode,
                        cursorColor: AppColors.blueColors[3],
                        cursorHeight: 26.h,
                        cursorWidth: 1.w,
                        style: TextStyles.text4,
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 4.h),
                          border: InputBorder.none,
                          hintText: " Search...",
                          hintStyle: TextStyles.text4.copyWith(
                            color: AppColors.greyColors[3],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Container(
                    width: 75.w,
                    height: 32.14.h,
                    padding: EdgeInsets.only(
                      top: 4.06.h,
                      bottom: 4.33.h,
                      left: 4.29.w,
                      right: 7.36.w,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.blueColors[0],
                      borderRadius: BorderRadius.circular(100.h),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          "assets/icons/filter.png",
                          width: 23.75.w,
                          height: 23.75.h,
                          fit: BoxFit.cover,
                        ),
                        Text(
                          "Filters",
                          style: TextStyles.text5,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 12.h,
            ),

            //* 리스트 부분
            Expanded(
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      top: index == 0 ? 12.h : 0,
                      bottom:
                          index == Constants.dummyData.length - 1 ? 24.h : 0,
                    ),
                    child: Center(
                      child: Container(
                        width: 327.w,
                        height: 106.h,
                        decoration: BoxDecoration(
                          color: AppColors.whiteColors[0],
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.blueColors[2].withOpacity(0.06),
                              blurRadius: 35,
                              offset: Offset(0, 10.h),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: Image.asset(
                                Constants.dummyData[index]["image"]!,
                                width: 79.w,
                                height: 92.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: 18.w,
                            ),
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    Text(
                                      Constants.dummyData[index]["date"]!,
                                      style: TextStyles.text3,
                                    ),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    Text(
                                      Constants.dummyData[index]["title"]!,
                                      style: TextStyles.title2,
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 12.h),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "assets/icons/map-pin.png",
                                        width: 14.w,
                                        height: 14.h,
                                        fit: BoxFit.cover,
                                      ),
                                      SizedBox(
                                        width: 6.w,
                                      ),
                                      Text(
                                        Constants.dummyData[index]["location"]!,
                                        style: TextStyles.text3.copyWith(
                                            color: AppColors.greyColors[1]),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )),
                            SizedBox(
                              width: 14.89.w,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 12.h,
                  );
                },
                itemCount: Constants.dummyData.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
