import 'package:event_book_app/presentation/bloc/home_menu/home_menu_bloc.dart';
import 'package:event_book_app/presentation/pages/empty_events/empty_events_page.dart';
import 'package:event_book_app/presentation/pages/event_details/event_details_page.dart';
import 'package:event_book_app/presentation/pages/home/home_page.dart';
import 'package:event_book_app/presentation/pages/map_view/map_view_page.dart';
import 'package:event_book_app/presentation/pages/onboarding/onboarding_page.dart';
import 'package:event_book_app/presentation/pages/resset_password/resset_password_page.dart';
import 'package:event_book_app/presentation/pages/search_event/search_events_page.dart';
import 'package:event_book_app/presentation/pages/see_all_events/see_all_events_page.dart';
import 'package:event_book_app/presentation/pages/signin/signin_page.dart';
import 'package:event_book_app/presentation/pages/signup/signup_page.dart';
import 'package:event_book_app/presentation/pages/verification/verification_page.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final appRoutes = [
  //? 온보딩
  GoRoute(
    path: "/onboarding",
    name: "onboarding",
    pageBuilder: (context, state) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
      return const NoTransitionPage(child: OnboardingPage());
    },
  ),

  //? 로그인
  GoRoute(
      path: "/signin",
      name: "signin",
      pageBuilder: (context, state) {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
        return const NoTransitionPage(child: SigninPage());
      }),

  //? 회원가입
  GoRoute(
    path: "/signup",
    name: "signup",
    builder: (context, state) => const SignupPage(),
  ),

  //? 인증
  GoRoute(
    path: "/verification",
    name: "verification",
    builder: (context, state) => const VerificationPage(),
  ),

  //? 비밀번호변경
  GoRoute(
    path: "/ressetPassword",
    name: "ressetPassword",
    builder: (context, state) => const RessetPasswordPage(),
  ),

  //? 홈화면
  GoRoute(
      path: "/home",
      name: "home",
      pageBuilder: (context, state) {
        bool menuState = context.watch<HomeMenuBloc>().state.isMenu;

        if (menuState) {
          SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
        } else {
          SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
        }
        return NoTransitionPage(key: state.pageKey, child: const HomePage());
      }),

  //? 이벤트
  GoRoute(
      path: "/emptyEvents",
      name: "emptyEvents",
      pageBuilder: (context, state) {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
        return const NoTransitionPage(child: EmptyEventsPage());
      }),

  //? 이벤트 전체
  GoRoute(
    path: "/seeAllEvents",
    name: "seeAllEvents",
    pageBuilder: (context, state) =>
        const NoTransitionPage(child: SeeAllEventsPage()),
  ),

  //? 이벤트 검색
  GoRoute(
      path: "/searchEvents",
      name: "searchEvents",
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: SearchEventsPage());
      }),

  //? 이벤트 상세
  GoRoute(
      path: "/eventDetails",
      name: "eventDetails",
      builder: (context, state) {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
        return const EventDetailsPage();
      }),

  //? 맵
  GoRoute(
    path: "/mapView",
    name: "mapView",
    pageBuilder: (context, state) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

      return const NoTransitionPage(child: MapViewPage());
    },
  ),
];
