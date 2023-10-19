import 'package:bloc_test/bloc_test.dart';
import 'package:fl_lesson12/feature/color/presentation/cubit/color_cubit.dart';
import 'package:fl_lesson12/feature/color/presentation/page/color_page.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

class MockColorCubit extends MockCubit<ColorState> implements ColorCubit {}

void main() {
  group('ColorPage tests:', () {
    Widget wrap({required Widget child}) {
      return MaterialApp(
        home: child,
      );
    }

    testWidgets('build', (widgetTester) async {
      final testKey = UniqueKey();

      final ColorCubit cubit = MockColorCubit();

      when(() => cubit.state)
          .thenReturn(const ColorCurrentState(color: Colors.black));

      GetIt.I.registerFactory(() => cubit);

      final testWidget = wrap(
        child: CubitPage(
          key: testKey,
        ),
      );

      await widgetTester.pumpWidget(testWidget);

      expect(find.byKey(testKey), findsOneWidget);
      expect(find.byType(CubitPage), findsOneWidget);
      expect(find.text(Colors.black.toString()), findsOneWidget);
      expect(find.byType(ColorPicker), findsOneWidget);

      expect(
          find.byWidgetPredicate((widget) =>
              widget is Container &&
              widget.constraints?.minWidth == 200 &&
              widget.constraints?.minHeight == 200 &&
              widget.color == Colors.black),
          findsOneWidget);

      await widgetTester.tap(find.byWidgetPredicate((widget) =>
          widget is ColorIndicator && widget.color == const Color(0xFFF44336)));

      await widgetTester.pump();

      verify(() => cubit.setColor(const Color(0xFFF44336))).called(1);
    });
  });
}
