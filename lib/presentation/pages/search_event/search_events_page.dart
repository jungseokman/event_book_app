import 'package:event_book_app/config/styles.dart';
import 'package:event_book_app/presentation/pages/search_event/widgets/search_and_filter.dart';
import 'package:event_book_app/presentation/pages/search_event/widgets/search_list.dart';
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
            SearchAndFilter(
                textEditingController: textEditingController,
                focusNode: _focusNode),
            SizedBox(
              height: 12.h,
            ),

            //* 리스트 부분
            const SearchList(),
          ],
        ),
      ),
    );
  }
}
