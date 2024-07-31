import 'package:event_book_app/config/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomPageView extends StatefulWidget {
  const BottomPageView({
    super.key,
  });

  @override
  State<BottomPageView> createState() => _BottomPageViewState();
}

class _BottomPageViewState extends State<BottomPageView> {
  final PageController _pageController =
      PageController(viewportFraction: (327 / 375).w);

  List<Widget> _buildItems() {
    return List.generate(5, (index) {
      return Center(
        child: Container(
          width: 327.w,
          height: 106.h,
          padding: EdgeInsets.only(
            top: 7.h,
            bottom: 7.h,
            left: 9.w,
            right: 14.89.w,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.h),
            color: AppColors.whiteColors[0],
            boxShadow: [
              BoxShadow(
                color: AppColors.purpleColor[2].withOpacity(0.1237),
                blurRadius: 32,
                offset: Offset(0, 16.h),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: Row(
            children: [
              Image.asset(
                "assets/images/map_sample.png",
                height: 92.h,
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: 17.w,
              ),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Wed, Apr 28 • 5:30 PM",
                          style: TextStyles.text3,
                        ),
                        Image.asset(
                          "assets/icons/bookmark.png",
                          height: 16.h,
                          fit: BoxFit.cover,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      "Jo Malone London’s Mother’s Day Presents",
                      style: TextStyles.text1.copyWith(
                        height: 1.4,
                      ),
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/icons/location_fill.png",
                          width: 14.w,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        Text(
                          "Radius Gallery • Santa Cruz, CA",
                          style: TextStyles.text3.copyWith(
                            color: AppColors.greyColors[1],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _pageController.jumpToPage(1);
    });
    _pageController.addListener(() {
      if (_pageController.page == _buildItems().length + 1) {
        _pageController.jumpToPage(1);
      } else if (_pageController.page == 0) {
        _pageController.jumpToPage(_buildItems().length);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final items = _buildItems();
    final itemCount = items.length;
    return Positioned(
      bottom: 37.h,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 106.h,
        child: PageView.builder(
          controller: _pageController,
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          itemCount: itemCount + 2,
          itemBuilder: (context, index) {
            if (index == 0) {
              return items[itemCount - 1];
            } else if (index == itemCount + 1) {
              return items[0];
            }
            return items[index - 1];
          },
        ),
      ),
    );
  }
}
