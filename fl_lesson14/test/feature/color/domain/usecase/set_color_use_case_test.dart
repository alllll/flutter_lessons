import 'package:dartz/dartz.dart';
import 'package:fl_lesson12/feature/color/domain/entity/color_entity.dart';
import 'package:fl_lesson12/feature/color/domain/entity/color_failure.dart';
import 'package:fl_lesson12/feature/color/domain/repository/color_repository.dart';
import 'package:fl_lesson12/feature/color/domain/usecase/select_color_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockColorRepository extends Mock implements ColorRepository {}

class ColorEntityFake extends Fake implements ColorEntity {}

void main() {
  setUpAll(() {
    registerFallbackValue(ColorEntityFake());
  });

  group('SetColorUseCase tests:', () {
    ColorRepository colorRepository = MockColorRepository();

    setUp(() => print('setUp'));

    test('При успешном сохранении цвет должен его возвращать', () async {
      final ColorEntity colorEntity =
          ColorEntity(color: Colors.black.value.toString());
      when(() => colorRepository.write(any())).thenAnswer((_) async {
        return Right<ColorFailure, ColorEntity>(colorEntity);
      });

      SelectColorUseCase setColorUseCase =
          SelectColorUseCase(colorRepository: colorRepository);

      final result = await setColorUseCase.call(colorEntity);

      verify(() => colorRepository.write(any())).called(1);

      expect(result, equals(Right<ColorFailure, ColorEntity>(colorEntity)));
    });
  });
}
