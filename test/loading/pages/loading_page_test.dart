import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:one_minute_bloc_tuto/loading/loading.dart';

void main() {
  group("LoadingPage", () {
    testWidgets("Work but ...", (tester) async {
      await tester.pumpWidget(const MaterialApp(home: LoadingPage()));
      await tester.pumpAndSettle();
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });
}
