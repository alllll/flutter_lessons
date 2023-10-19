import 'package:fl_lesson12/core/di/configure_dependencies.dart';
import 'package:fl_lesson12/feature/color/presentation/page/color_page.dart';
import 'package:fl_lesson12/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Integration tests: MyApp', () {
    testWidgets('тест', (widgetTester) async {
      final testKey = UniqueKey();
      configureDependencies();
      await widgetTester.pumpWidget(
          MyApp(
            key: testKey,
          ),
          const Duration(seconds: 5));

      expect(find.byKey(testKey), findsOneWidget);
      expect(find.byType(CubitPage), findsOneWidget);
    });
  });
}
