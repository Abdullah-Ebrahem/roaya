import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sec_project/screens/master/controller.dart';

class MasterPage extends StatefulWidget {
  const MasterPage({super.key});

  @override
  State<MasterPage> createState() => _MasterPageState();
}

class _MasterPageState extends State<MasterPage> {
  final controller = MasterController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Are you sure you want to quit'),
            actions: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9.r)),
                      backgroundColor: Theme.of(context).primaryColor),
                  onPressed: () {
                    if (Platform.isAndroid) {
                      SystemNavigator.pop();
                    } else if (Platform.isIOS) {
                      exit(0);
                    }
                  },
                  child: const Text('Quit')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel'))
            ],
          ),
        );
        return true;
      },
      child: Scaffold(
        body: controller.screens[controller.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            selectedItemColor: Colors.white,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            selectedIconTheme: IconThemeData(size: 24.w),
            selectedFontSize: 14.sp,
            backgroundColor: Theme.of(context).primaryColor,
            currentIndex: controller.currentIndex,
            onTap: (value) {
              controller.currentIndex = value;
              setState(() {});
            },
            items: const [
              BottomNavigationBarItem(
                  backgroundColor: Colors.black,
                  label: 'My appointment',
                  icon: Icon(
                    Icons.home,
                  )),
              BottomNavigationBarItem(
                  label: 'Pick appointment',
                  icon: Icon(
                    Icons.access_time_filled,
                  )),
              BottomNavigationBarItem(
                  label: 'Profile',
                  icon: Icon(
                    Icons.person,
                  )),
            ]),
      ),
    );
  }
}
