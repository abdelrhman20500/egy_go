import 'package:flutter/material.dart';

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 40);

    final firstControl = Offset(size.width * 0.25, 0);
    final firstEnd = Offset(size.width * 0.5, 30);
    path.quadraticBezierTo(firstControl.dx, firstControl.dy, firstEnd.dx, firstEnd.dy);

    final secondControl = Offset(size.width * 0.75, 60);
    final secondEnd = Offset(size.width, 20);
    path.quadraticBezierTo(secondControl.dx, secondControl.dy, secondEnd.dx, secondEnd.dy);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}