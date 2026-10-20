import 'package:flutter/material.dart';

class CustomDividerWithText extends StatelessWidget {
  const CustomDividerWithText({super.key,});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: Divider(color: Colors.amber)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text('or', style: TextStyle(color: Color(0xff0A3030)),),
        ),
        Expanded(child: Divider(color: Colors.amber)),
      ],
    );
  }
}
