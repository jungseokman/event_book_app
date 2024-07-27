import 'package:event_book_app/config/routers.dart';
import 'package:event_book_app/presentation/bloc/home_menu/home_menu_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(List<String> args) async {
  //? 위젯 시스템 초기화, 비동기 작업 지원
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  //? 스플래시화면
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  //? 온보딩 스킵 유무 확인
  final prefs = await SharedPreferences.getInstance();
  final bool isOnboardingSkip = prefs.getBool('onboardingSkip') ?? false;

  runApp(EventBookingApp(
    isOnboardingSkip: isOnboardingSkip,
  ));
}

class EventBookingApp extends StatelessWidget {
  const EventBookingApp({super.key, required this.isOnboardingSkip});

  final bool isOnboardingSkip;

  @override
  Widget build(BuildContext context) {
    //? 스플래시 화면 제거
    FlutterNativeSplash.remove();
    final initialLocation = isOnboardingSkip ? '/signin' : '/onboarding';

    //? 반응형 설정
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (context, child) {
          //? 블럭 상태관리 세팅
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => HomeMenuBloc(),
              ),
            ],

            //? 고라우터 연결
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routerConfig: createRouter(initialLocation),
            ),
          );
        });
  }
}
