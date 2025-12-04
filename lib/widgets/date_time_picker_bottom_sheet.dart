import 'package:datetime_picker_app/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../providers/date_time_controller.dart';
import 'scroll_picker.dart';
import 'time_slot_preview.dart';

class DateTimePickerBottomSheet extends StatelessWidget {
  const DateTimePickerBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final DateTimeController controller = Get.put(DateTimeController());

    return Container(
      height: MediaQuery.of(context).size.height * 0.55,
      decoration: const BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            spreadRadius: 1,
            blurRadius: 12,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(height: 20),
          Container(
            width: 120,
            height: 5,
            decoration: BoxDecoration(
              color: AppColors.dragHandle,
              borderRadius: BorderRadius.circular(5),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 22,
                    backgroundColor: AppColors.primary.withOpacity(0.5),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6.0),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.background,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          Text(
            'select date & time',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w400,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 10),
          Divider(thickness: 1.2, color: AppColors.divider),

          const SizedBox(height: 15),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'your pickup is on:',
                  style: TextStyle(fontSize: 14, color: Colors.black87),
                ),
                const SizedBox(width: 12),
                Obx(() {
                  final dateTime = controller.getSelectedDateTime();
                  return TimeSlotPreview(
                    displayText: dateTime.getDisplayText(),
                  );
                }),
              ],
            ),
          ),

          const SizedBox(height: 20),

          SizedBox(
            height: 150,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Obx(
                            () => ScrollPicker(
                              items: controller.months,
                              selectedValue: controller.selectedMonth.value,
                              onValueChanged: controller.updateMonth,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Obx(
                            () => ScrollPicker(
                              items: controller.days,
                              selectedValue: controller.selectedDay.value,
                              onValueChanged: controller.updateDay,
                            ),
                          ),
                        ),
                        SizedBox(width: 28),
                        Expanded(
                          child: Obx(
                            () => ScrollPicker(
                              items: controller.hours,
                              selectedValue: controller.selectedHour.value,
                              onValueChanged: controller.updateHour,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            ':',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Obx(
                            () => ScrollPicker(
                              items: controller.minutes,
                              selectedValue: controller.selectedMinute.value,
                              onValueChanged: controller.updateMinute,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Obx(
                            () => ScrollPicker(
                              items: controller.periods,
                              selectedValue: controller.selectedPeriod.value,
                              onValueChanged: controller.updatePeriod,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: controller.confirmDateTime,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'confirm date & time',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: AppColors.background,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
