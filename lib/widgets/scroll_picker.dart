import 'package:flutter/material.dart';

class ScrollPicker extends StatefulWidget {
  final List<String> items;
  final String selectedValue;
  final Function(String) onValueChanged;
  final double itemHeight;

  const ScrollPicker({
    super.key,
    required this.items,
    required this.selectedValue,
    required this.onValueChanged,
    this.itemHeight = 50,
  });

  @override
  State<ScrollPicker> createState() => _ScrollPickerState();
}

class _ScrollPickerState extends State<ScrollPicker> {
  late FixedExtentScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    final initialIndex = widget.items.indexOf(widget.selectedValue);
    _scrollController = FixedExtentScrollController(
      initialItem: initialIndex >= 0 ? initialIndex : 0,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.itemHeight * 3,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ListWheelScrollView.useDelegate(
            controller: _scrollController,
            itemExtent: widget.itemHeight,
            physics: const FixedExtentScrollPhysics(),

            perspective: 0.003,
            onSelectedItemChanged: (index) {
              widget.onValueChanged(widget.items[index]);
            },
            childDelegate: ListWheelChildBuilderDelegate(
              builder: (context, index) {
                if (index < 0 || index >= widget.items.length) return null;

                final isSelected = widget.items[index] == widget.selectedValue;

                return Center(
                  child: Text(
                    widget.items[index],
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: isSelected
                          ? FontWeight.w500
                          : FontWeight.w400,
                      color: isSelected ? const Color(0xFFE74C3C) : Colors.grey,
                    ),
                  ),
                );
              },
              childCount: widget.items.length,
            ),
          ),

          Positioned(
            top: (widget.itemHeight * 1) - 4,
            left: -10,
            right: 0,
            child: const Divider(color: Colors.black, thickness: 1, indent: 20),
          ),

          Positioned(
            bottom: (widget.itemHeight * 1) - 4,
            left: -10,
            right: 0,
            child: const Divider(color: Colors.black, thickness: 1, indent: 20),
          ),
        ],
      ),
    );
  }
}
