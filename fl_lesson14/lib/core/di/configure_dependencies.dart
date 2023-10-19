import 'package:fl_lesson12/feature/color/data/data_source/file_local_color_datasource.dart';
import 'package:fl_lesson12/feature/color/data/data_source/local_color_datasource.dart';
import 'package:fl_lesson12/feature/color/data/data_source/shared_pref_local_color_datasource.dart';
import 'package:fl_lesson12/feature/color/data/repository/color_repository_impl.dart';
import 'package:fl_lesson12/feature/color/domain/repository/color_repository.dart';
import 'package:fl_lesson12/feature/color/domain/usecase/get_color_use_case.dart';
import 'package:fl_lesson12/feature/color/domain/usecase/select_color_use_case.dart';
import 'package:fl_lesson12/feature/color/presentation/cubit/color_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

void configureDependencies() {
  if (kIsWeb) {
    GetIt.I.registerFactory<LocalColorDataSource>(
        () => SharedPrefLocalColorDataSource());
  } else {
    GetIt.I.registerFactory<LocalColorDataSource>(() => FileColorDataSource());
  }

  GetIt.I.registerFactory<ColorRepository>(
      () => ColorRepositoryImpl(localColorDataSource: GetIt.I()));

  GetIt.I.registerFactory(() => GetColorUseCase(colorRepository: GetIt.I()));

  GetIt.I.registerFactory(() => SelectColorUseCase(colorRepository: GetIt.I()));

  GetIt.I.registerLazySingleton<ColorCubit>(
      () => ColorCubit(GetIt.I(), GetIt.I()));
}
