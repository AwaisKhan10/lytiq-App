// ignore_for_file: deprecated_member_use, use_super_parameters

import 'package:flutter/material.dart';

class SocialPressableButton extends StatefulWidget {
  final String text;
  final String iconPath; // asset image for icon
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final double iconSize;

  const SocialPressableButton({
    Key? key,
    required this.text,
    required this.iconPath,
    required this.onPressed,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black,
    this.borderRadius = 12,
    this.iconSize = 24,
  }) : super(key: key);

  @override
  State<SocialPressableButton> createState() => _SocialPressableButtonState();
}

class _SocialPressableButtonState extends State<SocialPressableButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onPressed();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedScale(
        scale: _isPressed ? 0.94 : 1.0,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeOut,
        child: AnimatedContainer(
          width: double.infinity,
          duration: const Duration(milliseconds: 100),
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(widget.borderRadius),
            border: Border.all(color: Colors.grey.shade300),
            boxShadow: _isPressed
                ? []
                : [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: const Offset(0, 3),
                      blurRadius: 6,
                    ),
                  ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                widget.iconPath,
                height: widget.iconSize,
                width: widget.iconSize,
              ),
              const SizedBox(width: 12),
              Text(
                widget.text,
                style: TextStyle(
                  color: widget.textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
