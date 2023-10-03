import 'package:fl_lesson9/app_data.dart';
import 'package:fl_lesson9/provider_page.dart';
import 'package:fl_lesson9/util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => AppData(backgroundColor: Util.randomColor()),
    child: MaterialApp(
      routes: {
        '/': (context) => const ProviderPage(),
        '/second': (context) => const ProviderPage(),
      },
    ),
  ));
}
