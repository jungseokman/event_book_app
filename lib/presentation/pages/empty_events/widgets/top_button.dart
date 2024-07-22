import 'package:event_book_app/config/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopButton extends StatefulWidget {
  const TopButton({
    super.key,
    required this.eventTypeButton,
    required this.isEventTypeButtonTrue,
    required this.isEventTypeButtonFalse,
  });

  final bool eventTypeButton;
  final VoidCallback isEventTypeButtonTrue;
  final VoidCallback isEventTypeButtonFalse;

  @override
  State<TopButton> createState() => _TopButtonState();
}

class _TopButtonState extends State<TopButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 295.w,
      height: 45.06.h,
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.w),
        color: AppColors.blackColors[1].withOpacity(0.0287),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: widget.isEventTypeButtonTrue,
            //! AnimatedContainer : container의 색상, 크기등 애니메이션 효과 (색상부분이 자연스럽지 않을 때가 있음)
            //! AnimatedOpacity : 불투명도 변경에 애니메이션 효과
            //! AnimatedPositioned : 위치 변경에 애니메이션 효과
            //! AnimatedAlign : 정렬위치 변경에 애니메이션 효과
            //! AnimatedDefaultTextStyle : 텍스트 스타일 변경에 애니메이션 효과
            //! Hero : 두 화면 간의 전환 시 애니메이션을 적용
            //! AnimatedCrossFade : 두 위젯간에 전환에 애니메이션 효과
            //! AnimatedList : 리스트 추가, 제거시 애니메이션 효과
            //! AnimatedSwitcher: 기존 위젯이 제거되고 새로운 위젯이 추가될 때 애니메이션을 적용합니다. (여러 위젯 가능)
            child: AnimatedSwitcher(
              //! 지속 시간
              duration: const Duration(milliseconds: 280),

              //! 애니메이션 전환 효과를 정의하는 빌더 (기본적으로 페이드 인-아웃 효과)
              transitionBuilder: (Widget child, Animation<double> animation) {
                //! ScaleTransition, FadeTransition, SlideTransition 등 다양한 전환 효과
                return FadeTransition(
                  //! opacity을 직접 설정 X -> AnimatedSwitcher가 적절한 값을 제공(animation)
                  opacity: animation,
                  child: child,
                );
              },
              //! 두가지 위젯을 변환
              child: widget.eventTypeButton
                  ? _buildSelectedButton("UPCOMING", true)
                  : _buildUnselectedButton("UPCOMING", false),
            ),
          ),
          GestureDetector(
            onTap: widget.isEventTypeButtonFalse,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 280),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(opacity: animation, child: child);
              },
              child: !widget.eventTypeButton
                  ? _buildSelectedButton("PAST EVENTS", false)
                  : _buildUnselectedButton("PAST EVENTS", true),
            ),
          ),
        ],
      ),
    );
  }
}

//* 선택되었을때 버튼
Widget _buildSelectedButton(String text, bool selected) {
  return Container(
    key: ValueKey(text + selected.toString()),
    width: 140.w,
    height: 35.04.h,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(100.w),
      color: AppColors.whiteColors[0],
      boxShadow: [
        BoxShadow(
          color: AppColors.blackColors[1].withOpacity(0.1),
          blurRadius: 20.h,
          offset: Offset(0, 5.h),
        ),
      ],
    ),
    child: Text(
      text,
      style: TextStyles.text1.copyWith(
        color: AppColors.blueColors[0],
      ),
    ),
  );
}

//* 선택되지 않았을때 버튼
Widget _buildUnselectedButton(String text, bool selected) {
  return Container(
    key: ValueKey(text + selected.toString()),
    width: 140.w,
    height: 35.04.h,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(100.w),
      color: Colors.transparent,
    ),
    child: Text(
      text,
      style: TextStyles.text1.copyWith(
        color: AppColors.greyColors[0],
      ),
    ),
  );
}
