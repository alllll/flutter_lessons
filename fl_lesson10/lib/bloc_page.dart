import 'package:fl_lesson10/bloc/color_bloc.dart';
import 'package:fl_lesson10/main.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocPage extends StatelessWidget {
  const BlocPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: colorBloc,
        ),
      ],
      child: Scaffold(
        appBar: AppBar(),
        body: SafeArea(
            child: Center(
          child: BlocConsumer<ColorBloc, ColorState>(
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
                            context
                                .read<ColorBloc>()
                                .add(NewRandomColorEvent());
                          },
                          child: const Text('Set random color')),
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
                        context
                            .read<ColorBloc>()
                            .add(NewColorEvent(color: color));
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
