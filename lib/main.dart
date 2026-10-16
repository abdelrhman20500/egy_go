import 'package:egy_go/features/onBoarding/presentation/view/on_boarding_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Egy_GO",
      debugShowCheckedModeBanner: false,
      home: const OnBoardingView(),
    );
  }
}
