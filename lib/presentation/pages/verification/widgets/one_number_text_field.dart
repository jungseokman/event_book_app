import 'package:event_book_app/config/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OneNumberTextField extends StatefulWidget {
  const OneNumberTextField({
    super.key,
    required this.focusNode,
    required this.controller,
  });

  final FocusNode focusNode;
  final TextEditingController controller;

  @override
  State<OneNumberTextField> createState() => _OneNumberTextFieldState();
}

class _OneNumberTextFieldState extends State<OneNumberTextField> {
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    setState(() {
      _isFocused =
          widget.focusNode.hasFocus || widget.controller.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(_handleFocusChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55.w,
      height: 55.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.h),
        border: Border.all(
          color: AppColors.greyColors[4],
        ),
      ),
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: [
          TextField(
            focusNode: widget.focusNode,
            controller: widget.controller,
            maxLength: 1,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: const InputDecoration(
              counterText: "",
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding: EdgeInsets.zero,
            ),
            style: TextStyles.title1.copyWith(height: 1),
            cursorColor: AppColors.blackColors[0],
            cursorHeight: 24.h,
          ),
          _isFocused
              ? const SizedBox()
              : Container(
                  width: 13.5.w,
                  height: 2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1),
                    color: AppColors.greyColors[7],
                  ),
                )
        ],
      ),
    );
  }
}
