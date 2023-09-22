import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sec_project/core/cache_helper.dart';
import 'package:sec_project/core/methods.dart';
import 'package:sec_project/screens/login/view.dart';
import 'package:sec_project/screens/master/view.dart';

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
      child: CacheHeper.getFirstTime() ? const LoginPage() : const MasterPage(),
      builder: (context, child) => MaterialApp(
        navigatorKey: navigatorKey,
        title: 'ROAYA',
        // dark theme///
        darkTheme: ThemeData(
            chipTheme: const ChipThemeData(backgroundColor: Color(0xff707070)),
            cardColor: const Color(0xff707070),
            inputDecorationTheme:
                const InputDecorationTheme(fillColor: Color(0xff212121)),
            brightness: Brightness.dark,
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffFFBB3B))),
            primaryColor: Colors.white,
            primarySwatch: Colors.brown,
            snackBarTheme:
                const SnackBarThemeData(backgroundColor: Color(0xff1A1A1A)),
            scaffoldBackgroundColor: Colors.black,
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: Color(0xff1A1A1A)),
            appBarTheme: const AppBarTheme(backgroundColor: Color(0xff1A1A1A))),

        //light mode
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.black,
          primarySwatch: Colors.amber,
          inputDecorationTheme:
              const InputDecorationTheme(fillColor: Color(0xffF5F5F5)),
          snackBarTheme:
              const SnackBarThemeData(backgroundColor: Color(0xffFFBB3B)),
          chipTheme: const ChipThemeData(backgroundColor: Color(0xffFFBB3B)),
          cardColor: const Color(0xffFFBB3B),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffFFBB3B))),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Color(0xffFFBB3B)),
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
