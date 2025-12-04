import 'package:datetime_picker_app/constants/app_colors.dart';
import 'package:flutter/material.dart';
import '../widgets/date_time_picker_bottom_sheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _showDateTimePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,

      isScrollControlled: true,
      builder: (context) => const DateTimePickerBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.schedule, size: 120, color: AppColors.primaryLight),
            const SizedBox(height: 24),
            Text(
              'Schedule Your Pickup',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Tap the button below to select your preferred pickup date and time',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: AppColors.textSecondary),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showDateTimePicker(context),
        backgroundColor: AppColors.primary,
        elevation: 0,
        icon: const Icon(Icons.calendar_today, color: AppColors.background),
        label: const Text(
          'Select Date & Time',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: AppColors.background,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
