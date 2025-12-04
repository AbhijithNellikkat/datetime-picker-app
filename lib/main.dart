import 'package:datetime_picker_app/constants/app_colors.dart';
import 'package:datetime_picker_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Date & Time Picker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Lufga', primaryColor: AppColors.primary),
      home: HomeScreen(),
    );
  }
}
