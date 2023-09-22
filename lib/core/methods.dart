import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();
void showMessage({required String msg}) {
  ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(SnackBar(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.only(
              topEnd: Radius.circular(28), topStart: Radius.circular(28))),
      content: Center(
        child: Text(
          msg,
          style: const TextStyle(fontSize: 30, color: Colors.white),
        ),
      )));
}

void navigateTo({required var page, bool withHistory = true}) {
  Navigator.of(navigatorKey.currentContext!).pushAndRemoveUntil(
      PageRouteBuilder(
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(
          opacity: animation,
          child: child,
        ),
        pageBuilder: (context, animation, secondaryAnimation) => page,
      ),
      (route) => withHistory);
}
