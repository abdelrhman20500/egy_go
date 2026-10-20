import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  const CircleIconButton({super.key, required this.icon,    this.size = 44,
    this.onPressed, this.iconColor = Colors.black87, this.iconSize = 20,
    this.backgroundColor = Colors.white, this.shadowColor = Colors.black12,});

  final IconData icon;
  final VoidCallback? onPressed;
  final Color iconColor;
  final double iconSize;
  final Color backgroundColor;
  final Color shadowColor;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: 8,
            spreadRadius: 1,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, color: iconColor, size: iconSize),
        padding: EdgeInsets.zero,
      ),
    );
  }
}