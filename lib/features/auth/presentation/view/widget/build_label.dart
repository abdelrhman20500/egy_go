import 'package:flutter/material.dart';
import '../../../../../Core/utilities/styles.dart';

class BuildLabel extends StatelessWidget {
  const BuildLabel({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Text(text, style: Styles.style16),
      ),
    );
  }
}
