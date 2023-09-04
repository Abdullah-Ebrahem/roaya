import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();
void showMessage({required String msg}) {
  ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(SnackBar(
      backgroundColor: Theme.of(navigatorKey.currentContext!).primaryColor,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.only(
              topEnd: Radius.circular(28), topStart: Radius.circular(28))),
      content: Center(
        child: Text(
          msg,
          style: const TextStyle(fontSize: 30),
        ),
      )));
}

void navigateTo({required var page, bool withHistory = true}) {
  Navigator.of(navigatorKey.currentContext!).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => page,
      ),
      (route) => withHistory);
}
