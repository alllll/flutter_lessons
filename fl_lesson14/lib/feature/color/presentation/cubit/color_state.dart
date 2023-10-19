part of 'color_cubit.dart';

sealed class ColorState extends Equatable {
  final Color color;
  final bool isLoading;
  final String error;

  const ColorState(
      {required this.color, this.isLoading = false, this.error = ''});

  @override
  List<Object> get props => [color, isLoading, error];
}

final class ColorCurrentState extends ColorState {
  const ColorCurrentState({required super.color, super.isLoading, super.error});
}
