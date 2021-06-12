import 'package:calculator_with_dark_mode/styles/text.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  final String title;
  final bool isSelected;

  HomeTab({Key? key, required this.title, required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            this.title,
            style: this.isSelected
                ? AppTextStyles.tabText
                : AppTextStyles.unselectedTabText,
          ),
          SizedBox(height: 8),
          Container(
            width: 40,
            height: 4,
            color: this.isSelected ? Colors.red : Colors.transparent,
          )
        ],
      ),
    );
  }
}
