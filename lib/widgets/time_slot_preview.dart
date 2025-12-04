import 'package:flutter/material.dart';

class TimeSlotPreview extends StatelessWidget {
  final String displayText;

  const TimeSlotPreview({super.key, required this.displayText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
      decoration: BoxDecoration(
        color: const Color(0xFFFFD4CC),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: const Color(0xFFE8907A), width: 1.5),
      ),
      child: Text(
        displayText,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
    );
  }
}
