import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    super.key,
    required this.text1,
    required this.text2,
    this.onTapText2,
  });

  final String text1;
  final String text2;
  final VoidCallback? onTapText2;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.black),
          children: [
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: Text(
                text1,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff0A3030),
                ),
              ),
            ),
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: InkWell(
                onTap: onTapText2,
                child: Text(
                  text2,
                  style: const TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
