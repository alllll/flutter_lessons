import 'package:fl_lesson10/cubit/color_cubit.dart';
import 'package:fl_lesson10/main.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitPage extends StatelessWidget {
  const CubitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: colorCubit,
        ),
      ],
      child: Scaffold(
        appBar: AppBar(),
        body: SafeArea(
            child: Center(
          child: BlocConsumer<ColorCubit, ColorState>(
            listener: (context, state) {
              print(state);
            },
            buildWhen: (previous, current) {
              return true;
            },
            builder: (context, state) {
              return Column(
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    color: state.color,
                    child: Column(children: [
                      Text(state.color.toString()),
                      ElevatedButton(
                          onPressed: () {
                            context.read<ColorCubit>().newRandomColor();
                          },
                          child: const Text('Set random color')),
                      ElevatedButton(
                          onPressed: () {
                            context.read<ColorCubit>().resetColor();
                          },
                          child: const Text('Reset color')),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/second');
                          },
                          child: const Text('Second Page'))
                    ]),
                  ),
                  ColorPicker(
                      color: state.color,
                      onColorChanged: (color) {
                        context.read<ColorCubit>().newColor(color);
                      }),
                ],
              );
            },
          ),
        )),
      ),
    );
  }
}
