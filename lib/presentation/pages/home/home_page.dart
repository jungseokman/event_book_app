import 'package:event_book_app/config/styles.dart';
import 'package:event_book_app/presentation/pages/home/widgets/bottom_sheet_component.dart';
import 'package:event_book_app/presentation/pages/home/widgets/home_appbar.dart';
import 'package:event_book_app/presentation/pages/home/widgets/home_body.dart';
import 'package:event_book_app/presentation/pages/home/widgets/top_menu_lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return Scaffold(
        backgroundColor: AppColors.whiteColors[0],
        body: const Stack(
          children: [
            HomeBody(),
            //* 상단 앱바
            HomeAppbar(),

            //* 상단 수평 메뉴 리스트
            TopMenuLists(),

            //* 하단 메뉴
            BottomSheetComponent(),
          ],
        ));
  }
}
