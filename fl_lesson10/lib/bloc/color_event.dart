part of 'color_bloc.dart';

sealed class ColorEvent {}

final class NewRandomColorEvent extends ColorEvent {}

final class NewColorEvent extends ColorEvent {
  final Color color;

  NewColorEvent({required this.color});
}

final class ResetColorEvent extends ColorEvent {}
