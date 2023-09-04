import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sec_project/core/button.dart';
import 'package:sec_project/core/cache_helper.dart';
import 'package:sec_project/screens/appointments/controller.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  final controller = AppointmentsController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Book an appointment'),
      ),
      body: Stepper(
        controlsBuilder: (context, details) {
          return details.stepIndex == 2
              ? const SizedBox.shrink()
              : Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9.r))),
                      onPressed: details.onStepContinue,
                      child: Text('Continue',
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                    TextButton(
                        onPressed: details.onStepCancel,
                        child: Text('Back',
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)))
                  ],
                );
        },
        steps: [
          Step(
            isActive: controller.currentIndex == 0,
            title: Text('Choose day',
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            content: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    fixedSize: Size(120.w, 44.h),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9.r))),
                onPressed: () async {
                  controller.date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 7)));
                  setState(() {});
                },
                child: Text(
                  'choose day',
                  style: TextStyle(fontSize: 16.sp),
                )),
          ),
          Step(
            isActive: controller.currentIndex == 1,
            title: Text('Choose day',
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            content: Container(
              padding: EdgeInsetsDirectional.only(start: 10.w, end: 5.w),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(9.r)),
              child: DropdownButton<String>(
                iconEnabledColor: Colors.white,
                dropdownColor: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(9.r),
                value: controller.appointment,
                items: List.generate(
                    controller.appointments.length,
                    (index) => DropdownMenuItem(
                        value: controller.appointments[index],
                        child: Text(
                          controller.appointments[index],
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ))),
                onChanged: (value) {
                  controller.appointment = value!;
                  CacheHeper.saveAppointment(
                      appointment: controller.appointment);
                  setState(() {});
                },
              ),
            ),
          ),
          Step(
              state: StepState.complete,
              title: Text('Confirm appointment',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              content: MyButton(
                text: 'Confirm',
                onPress: controller.confirmAppointment,
              )),
        ],
        currentStep: controller.currentIndex,
        onStepContinue: () {
          if (controller.currentIndex != 2) {
            setState(() {
              controller.currentIndex++;
            });
          }
        },
        onStepCancel: () {
          if (controller.currentIndex != 0) {
            setState(() {
              controller.currentIndex--;
            });
          }
        },
        onStepTapped: (value) {
          setState(() {
            controller.currentIndex = value;
          });
        },
      ),
    );
  }
}
