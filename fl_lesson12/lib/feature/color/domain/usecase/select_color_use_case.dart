import 'package:dartz/dartz.dart';
import 'package:fl_lesson12/core/use_case/use_case.dart';
import 'package:fl_lesson12/feature/color/domain/entity/color_entity.dart';
import 'package:fl_lesson12/feature/color/domain/entity/color_failure.dart';
import 'package:fl_lesson12/feature/color/domain/repository/color_repository.dart';

class SelectColorUseCase extends UseCase<ColorEntity, ColorEntity> {
  final ColorRepository colorRepository;

  SelectColorUseCase({required this.colorRepository});
  @override
  Future<Either<ColorFailure, ColorEntity>> call(ColorEntity params) {
    return colorRepository.write(params);
  }
}
