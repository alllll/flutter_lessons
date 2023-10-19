import 'package:dartz/dartz.dart';
import 'package:fl_lesson12/feature/color/data/data_source/local_color_datasource.dart';
import 'package:fl_lesson12/feature/color/domain/entity/color_failure.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefLocalColorDataSource implements LocalColorDataSource {
  @override
  Future<Either<ColorFailure, String>> read() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      return Right(prefs.getString('color') ?? '0xFFFFFFFF');
    } catch (e) {
      return Left(ColorFailure(code: 1, message: e.toString()));
    }
  }

  @override
  Future<Either<ColorFailure, String>> write(String color) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('color', color);

      return Right(prefs.getString('color') ?? '0xFFFFFFFF');
    } catch (e) {
      return Left(ColorFailure(code: 1, message: e.toString()));
    }
  }
}
