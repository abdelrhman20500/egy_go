import 'package:egy_go/Core/Api/simple_bloc_observer.dart';
import 'package:egy_go/features/layout/presentation/view/layout_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Egy_GO",
      debugShowCheckedModeBanner: false,
      home: LayoutView(),
    );
  }
}
