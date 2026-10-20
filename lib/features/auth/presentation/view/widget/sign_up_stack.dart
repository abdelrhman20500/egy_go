import 'package:flutter/material.dart';

import '../../../../onBoarding/presentation/view/widget/wave_clipper.dart';

class SignUpStack extends StatelessWidget {
  const SignUpStack({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          height: height * 0.32,
          width: double.infinity,
          child: Image.asset(
            'assets/images/onboarding2 image.png',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: -1,
          left: 0,
          right: 0,
          child: ClipPath(
            clipper: WaveClipper(),
            child: Container(height: 60, color: const Color(0xFFFFFBF5)),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFF0B3D2E), width: 3),
                boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10)],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset('assets/images/logo.png'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
