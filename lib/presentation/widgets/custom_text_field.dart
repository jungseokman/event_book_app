import 'package:event_book_app/config/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.imagePath,
    required this.textEditingController,
    this.isPw = false,
    this.hint = "",
  });

  final String imagePath;
  final bool isPw;
  final TextEditingController textEditingController;
  final String hint;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 56.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: _focusNode.hasFocus
              ? AppColors.blueColors[0]
              : AppColors.greyColors[4],
        ),
        borderRadius: BorderRadius.circular(12.h),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 15.w,
      ),
      child: Row(
        children: [
          AnimatedCrossFade(
            firstChild: Image.asset(
              widget.imagePath,
              width: 22.w,
              height: 22.h,
              fit: BoxFit.cover,
              color: AppColors.blueColors[0],
            ),
            secondChild: Image.asset(
              widget.imagePath,
              width: 22.w,
              height: 22.h,
              fit: BoxFit.cover,
            ),
            crossFadeState: _focusNode.hasFocus
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 200),
          ),
          SizedBox(
            width: 14.w,
          ),
          Expanded(
            child: TextField(
              focusNode: _focusNode,
              obscureText: widget.isPw && _obscureText,
              decoration: InputDecoration(
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                hintText: widget.hint,
                hintStyle:
                    TextStyles.text6.copyWith(color: AppColors.greyColors[1]),
              ),
              style: TextStyles.text6.copyWith(height: 1.25),
              cursorColor: AppColors.blackColors[0],
              cursorHeight: 20.h,
            ),
          ),
          widget.isPw
              ? Row(
                  children: [
                    SizedBox(
                      width: 14.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      child: Image.asset(
                        "assets/icons/eye.png",
                        width: 24.w,
                        fit: BoxFit.cover,
                        color: _obscureText
                            ? AppColors.greyColors[5]
                            : AppColors.blueColors[0],
                      ),
                    ),
                  ],
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
