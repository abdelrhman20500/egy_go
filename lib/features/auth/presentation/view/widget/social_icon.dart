import 'package:flutter/material.dart';

class SocialIcon extends StatelessWidget {
  final String icon;
  const SocialIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: Colors.transparent,
      child: Image.asset(icon, width: 28, height: 28),
    );
  }
}
