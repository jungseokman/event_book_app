import 'package:event_book_app/config/styles.dart';
import 'package:event_book_app/presentation/widgets/custom_button.dart';
import 'package:event_book_app/presentation/pages/empty_events/widgets/top_button.dart';
import 'package:event_book_app/presentation/widgets/appbar_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class EmptyEventsPage extends StatefulWidget {
  const EmptyEventsPage({super.key});

  @override
  State<EmptyEventsPage> createState() => _EmptyEventsPageState();
}

class _EmptyEventsPageState extends State<EmptyEventsPage> {
  bool eventTypeButton = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColors[0],
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Column(
              children: [
                //* 앱바
                const AppbarCustom(
                  title: "Events",
                  isMoreIcon: true,
                ),
                SizedBox(
                  height: 20.12.h,
                ),

                //* 상단 버튼 2개
                TopButton(
                  eventTypeButton: eventTypeButton,
                  isEventTypeButtonTrue: () {
                    setState(() {
                      eventTypeButton = true;
                    });
                  },
                  isEventTypeButtonFalse: () {
                    setState(() {
                      eventTypeButton = false;
                    });
                  },
                ),
                SizedBox(
                  height: 97.82.h,
                ),
                Image.asset(
                  "assets/images/empty_event.png",
                  width: 202.w,
                  height: 202.h,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 31.h,
                ),
                Text(
                  eventTypeButton ? "No Upcoming Event" : "No Past Events",
                  style: TextStyles.title1,
                ),
                SizedBox(
                  height: 12.64.h,
                ),
                Text(
                  "Lorem ipsum dolor sit amet,",
                  style: TextStyles.text2,
                ),
                Text(
                  "consectetur",
                  style: TextStyles.text2,
                ),
              ],
            ),

            //* 이벤트 더보기 버튼
            CustomButton(
              title: "Explore Events",
              bottomPadding: 33.h,
              onTap: () {
                context.pushNamed("seeAllEvents");
              },
            )
          ],
        ),
      ),
    );
  }
}
