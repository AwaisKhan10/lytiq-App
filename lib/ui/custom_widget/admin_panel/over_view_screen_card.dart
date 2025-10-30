import 'package:flutter/material.dart';
import 'package:lytiq/core/contant/colors.dart';
import 'package:lytiq/core/contant/text_style.dart';

class CustomDashBoardOverViewUserCard extends StatelessWidget {
  const CustomDashBoardOverViewUserCard({
    super.key,
    required this.onTap,
    required this.text,
  });

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        //  width: screenWidth * 0.5,
        decoration: BoxDecoration(
          color: borderColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(child: Text(text, style: style16.copyWith())),
      ),
    );
  }
}
