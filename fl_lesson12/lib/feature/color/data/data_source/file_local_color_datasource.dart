import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fl_lesson12/feature/color/data/data_source/local_color_datasource.dart';
import 'package:fl_lesson12/feature/color/domain/entity/color_failure.dart';
import 'package:path_provider/path_provider.dart';

class FileColorDataSource implements LocalColorDataSource {
  @override
  Future<Either<ColorFailure, String>> read() async {
    try {
      final color = await readData();

      return Right(color);
    } catch (e) {
      return Left(ColorFailure(code: 1, message: e.toString()));
    }
  }

  @override
  Future<Either<ColorFailure, String>> write(String color) async {
    try {
      await writeData(color);

      return Right(color);
    } catch (e) {
      return Left(ColorFailure(code: 1, message: e.toString()));
    }
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/color.txt');
  }

  Future<void> writeData(String data) async {
    final file = await _localFile;

    await file.writeAsString(data);
  }

  Future<String> readData() async {
    final file = await _localFile;

    if (!file.existsSync()) {
      file.writeAsStringSync('0xFFFFFFF');
    }
    return await file.readAsString();
  }
}
