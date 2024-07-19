import 'package:event_book_app/config/styles.dart';
import 'package:event_book_app/presentation/pages/see_all_events/widgets/list_component.dart';
import 'package:event_book_app/presentation/widgets/appbar_custom.dart';
import 'package:flutter/material.dart';

class SeeAllEventsPage extends StatelessWidget {
  const SeeAllEventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColors[0],
      body: const SafeArea(
          bottom: false,
          child: Column(
            children: [
              //* 앱 바
              AppbarCustom(
                title: "Events",
                isMoreIcon: true,
                isSearchIcon: true,
              ),

              //* 리스트 컴포넌트
              ListConponent(),
            ],
          )),
    );
  }
}
