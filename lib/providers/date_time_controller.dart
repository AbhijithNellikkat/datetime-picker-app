// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:developer';

import 'package:datetime_picker_app/constants/app_colors.dart';
import 'package:datetime_picker_app/models/date_time_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DateTimeController extends GetxController {
  final RxString selectedMonth = 'nov.'.obs;
  final RxString selectedDay = '25th'.obs;
  final RxString selectedHour = '01'.obs;
  final RxString selectedMinute = '02'.obs;
  final RxString selectedPeriod = 'pm'.obs;

  final List<String> months = ['oct.', 'nov.', 'dec.'];
  final List<String> days = List.generate(
    31,
    (i) => '${i + 1}${_getDaySuffix(i + 1)}',
  );

  final List<String> hours = List.generate(
    12,
    (i) => (i + 1).toString().padLeft(2, '0'),
  );

  final List<String> minutes = List.generate(
    60,
    (i) => i.toString().padLeft(2, '0'),
  );

  final List<String> periods = ['am', 'pm'];

  static String _getDaySuffix(int day) {
    if (day >= 11 && day <= 13) return 'th';
    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  @override
  void onInit() {
    super.onInit();
    _initializeToCurrentTime();
  }

  void _initializeToCurrentTime() {
    final now = DateTime.now();

    // Set current month
    if (now.month == 10)
      selectedMonth.value = 'oct.';
    else if (now.month == 11)
      selectedMonth.value = 'nov.';
    else if (now.month == 12)
      selectedMonth.value = 'dec.';

    // Set current day
    selectedDay.value = '${now.day}${_getDaySuffix(now.day)}';

    // Set current time
    int hour = now.hour;
    if (hour == 0) {
      selectedHour.value = '12';
      selectedPeriod.value = 'am';
    } else if (hour < 12) {
      selectedHour.value = hour.toString().padLeft(2, '0');
      selectedPeriod.value = 'am';
    } else if (hour == 12) {
      selectedHour.value = '12';
      selectedPeriod.value = 'pm';
    } else {
      selectedHour.value = (hour - 12).toString().padLeft(2, '0');
      selectedPeriod.value = 'pm';
    }

    selectedMinute.value = now.minute.toString().padLeft(2, '0');
  }

  void updateMonth(String month) {
    selectedMonth.value = month;
  }

  void updateDay(String day) {
    selectedDay.value = day;
  }

  void updateHour(String hour) {
    selectedHour.value = hour;
  }

  void updateMinute(String minute) {
    selectedMinute.value = minute;
  }

  void updatePeriod(String period) {
    selectedPeriod.value = period;
  }

  DateTimeModel getSelectedDateTime() {
    return DateTimeModel(
      month: selectedMonth.value,
      day: selectedDay.value,
      hour: selectedHour.value,
      minute: selectedMinute.value,
      period: selectedPeriod.value,
    );
  }

  void confirmDateTime() {
    final dateTime = getSelectedDateTime();
    log('Selected DateTime: ${dateTime.getFormattedDateTime()}');
    log('DateTime Object: ${dateTime.toDateTime()}');
    Get.back();
    Get.snackbar(
      '✔ Pickup Confirmed',
      'Scheduled for ${dateTime.getFormattedDateTime()}',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.primary,
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      duration: const Duration(seconds: 3),
    );
  }
}
