import 'package:dartz/dartz.dart';
import 'package:fl_lesson12/feature/color/data/data_source/local_color_datasource.dart';
import 'package:fl_lesson12/feature/color/domain/entity/color_entity.dart';
import 'package:fl_lesson12/feature/color/domain/entity/color_failure.dart';
import 'package:fl_lesson12/feature/color/domain/repository/color_repository.dart';

class ColorRepositoryImpl implements ColorRepository {
  final LocalColorDataSource _localColorDataSource;

  ColorRepositoryImpl({required LocalColorDataSource localColorDataSource})
      : _localColorDataSource = localColorDataSource;

  @override
  Future<Either<ColorFailure, ColorEntity>> read() async {
    final result = await _localColorDataSource.read();

    return result.fold((failure) => Left(failure),
        (color) => Right(ColorEntity(color: color)));
  }

  @override
  Future<Either<ColorFailure, ColorEntity>> write(ColorEntity color) async {
    final result = await _localColorDataSource.write(color.color);

    return result.fold((failure) => Left(failure),
        (color) => Right(ColorEntity(color: color)));
  }
}
