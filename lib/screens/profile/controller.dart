import 'package:flutter/material.dart';
import 'package:sec_project/core/cache_helper.dart';

class ProfileController {
  List<String> titles = [
    '${CacheHeper.getName()} ${CacheHeper.getLastName()}',
    CacheHeper.getEmail(),
    'Log out'
  ];
  List<IconData?> icons = [
    Icons.person,
    Icons.email_rounded,
    Icons.logout_rounded
  ];
}
