import 'package:flutter/material.dart';

import '../../core/cache_helper.dart';
import '../../core/methods.dart';

class AppointmentsController {
  TimeOfDay? time;
  DateTime? date;
  int currentIndex = 0;
  String appointment = 'No appointment';
  List<String> appointments = [
    'No appointment',
    '6.00 am',
    '7.00 am',
    '8.00 am',
    '9.00 am',
    '12.00 pm',
    '1.00 pm'
  ];

  void confirmAppointment() {
    if (date != null && appointment != appointments[0]) {
      CacheHeper.saveAppointment(
          appointment: '$appointment  ${date.toString().split(' ').first}');
      showMessage(msg: 'Appointment saved');
    } else {
      showMessage(msg: 'Choose a day and a time');
    }
  }
}
