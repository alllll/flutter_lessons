import 'package:dartz/dartz.dart';
import 'package:fl_lesson12/feature/color/domain/entity/color_failure.dart';

abstract class LocalColorDataSource {
  Future<Either<ColorFailure, String>> write(String color);

  Future<Either<ColorFailure, String>> read();
}
