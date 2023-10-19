import 'package:fl_lesson12/core/di/configure_dependencies.dart';
import 'package:fl_lesson12/feature/color/presentation/page/color_page.dart';
import 'package:flutter/material.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Clean Arch Demo',
      routes: {
        '/': (context) => const CubitPage(),
        '/second': (context) => const CubitPage(),
      },
    );
  }
}
