import 'package:event_book_app/presentation/pages/empty_events/empty_events_page.dart';
import 'package:event_book_app/presentation/pages/onboarding/onboarding_page.dart';
import 'package:event_book_app/presentation/pages/resset_password/resset_password_page.dart';
import 'package:event_book_app/presentation/pages/search_event/search_events_page.dart';
import 'package:event_book_app/presentation/pages/see_all_events/see_all_events_page.dart';
import 'package:event_book_app/presentation/pages/signin/signin_page.dart';
import 'package:event_book_app/presentation/pages/signup/signup_page.dart';
import 'package:event_book_app/presentation/pages/verification/verification_page.dart';
import 'package:go_router/go_router.dart';

final routers = GoRouter(
  initialLocation: "/onboarding",
  routes: [
    //? 온보딩
    GoRoute(
      path: "/onboarding",
      name: "onboarding",
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: OnboardingPage()),
    ),

    //? 로그인
    GoRoute(
      path: "/signin",
      name: "signin",
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: SigninPage()),
    ),

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

    //? 인증
    GoRoute(
      path: "/ressetPassword",
      name: "ressetPassword",
      builder: (context, state) => const RessetPasswordPage(),
    ),

    //? 이벤트
    GoRoute(
      path: "/emptyEvents",
      name: "emptyEvents",
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: EmptyEventsPage()),
    ),

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
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: SearchEventsPage()),
    ),
  ],
);
