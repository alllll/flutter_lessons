import 'package:fl_lesson10/bloc/color_bloc.dart';
import 'package:fl_lesson10/cubit/color_cubit.dart';
import 'package:fl_lesson10/cubit_page.dart';
import 'package:flutter/material.dart';

final colorBloc = ColorBloc();
final colorCubit = ColorCubit();

void main() {
  runApp(MaterialApp(
    routes: {
      '/': (context) => const CubitPage(),
      '/second': (context) => const CubitPage(),
    },
  ));
}
