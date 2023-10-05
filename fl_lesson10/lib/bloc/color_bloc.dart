import 'package:equatable/equatable.dart';
import 'package:fl_lesson10/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'color_event.dart';
part 'color_state.dart';

class ColorBloc extends Bloc<ColorEvent, ColorState> {
  ColorBloc() : super(const ColorInitialState()) {
    on<NewColorEvent>(onNewColorEvent);
    on<NewRandomColorEvent>(onNewRandomColorEvent);
  }

  void onNewColorEvent(NewColorEvent event, Emitter<ColorState> emit) {
    emit(ColorCurrentState(event.color));
  }

  void onNewRandomColorEvent(_, Emitter<ColorState> emit) {
    emit(ColorCurrentState(Util.randomColor()));
  }

  void onResetColorEvent(_, Emitter<ColorState> emit) {
    emit(const ColorInitialState());
  }
}
