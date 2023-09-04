import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sec_project/core/cache_helper.dart';
import 'package:sec_project/core/methods.dart';
import 'package:sec_project/screens/splash/view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHeper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: const SplashPage(),
      builder: (context, child) => MaterialApp(
        navigatorKey: navigatorKey,
        title: 'Sec Project',
        theme: ThemeData(
          primaryColor: const Color(0xffFFBB3B),
          appBarTheme: AppBarTheme(
              iconTheme: const IconThemeData(color: Colors.black),
              titleTextStyle: TextStyle(color: Colors.black, fontSize: 20.sp),
              backgroundColor: Colors.white,
              elevation: 0),
          scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        home: child,
      ),
    );
  }
}
