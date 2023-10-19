import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:fl_lesson12/feature/color/domain/entity/color_entity.dart';
import 'package:fl_lesson12/feature/color/domain/entity/color_failure.dart';
import 'package:fl_lesson12/feature/color/domain/usecase/get_color_use_case.dart';
import 'package:fl_lesson12/feature/color/domain/usecase/select_color_use_case.dart';
import 'package:fl_lesson12/feature/color/presentation/cubit/color_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSelectColorUseCase extends Mock implements SelectColorUseCase {}

class MockGetColorUseCase extends Mock implements GetColorUseCase {}

class ColorEntityFake extends Fake implements ColorEntity {}

void main() {
  setUpAll(() {
    registerFallbackValue(ColorEntityFake());
  });
  group('Color cubit tests:', () {
    blocTest('Проверка начального состояния кубита (успех)',
        build: () {
          final SelectColorUseCase selectColorUseCase =
              MockSelectColorUseCase();
          final GetColorUseCase getColorUseCase = MockGetColorUseCase();

          final ColorEntity colorEntity =
              ColorEntity(color: Colors.black.value.toString());

          when(() => getColorUseCase.call()).thenAnswer((invocation) async =>
              Right<ColorFailure, ColorEntity>(colorEntity));

          return ColorCubit(selectColorUseCase, getColorUseCase);
        },
        expect: () => [const ColorCurrentState(color: Colors.black)]);
  });

  blocTest(
    'Успешное сохранение цвета',
    build: () {
      final SelectColorUseCase selectColorUseCase = MockSelectColorUseCase();
      final GetColorUseCase getColorUseCase = MockGetColorUseCase();

      final ColorEntity colorEntity =
          ColorEntity(color: Colors.black.value.toString());

      final ColorEntity newColorEntity =
          ColorEntity(color: const Color(0xFF324444).value.toString());

      when(() => getColorUseCase.call()).thenAnswer(
          (invocation) async => Right<ColorFailure, ColorEntity>(colorEntity));

      when(() => selectColorUseCase.call(any())).thenAnswer(
          (invocation) async =>
              Right<ColorFailure, ColorEntity>(newColorEntity));

      return ColorCubit(selectColorUseCase, getColorUseCase);
    },
    act: (cubit) => cubit.setColor(const Color(0xFF324444)),
    expect: () => [
      const ColorCurrentState(color: Colors.black),
      const ColorCurrentState(color: Color(0xFF324444))
    ],
  );
}
