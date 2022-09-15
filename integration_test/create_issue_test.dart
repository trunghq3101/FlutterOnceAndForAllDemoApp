import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_community/main.dart' as app;

main() {
  testWidgets('Create new issue', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();
    await tester.tap(find.text('CREATE'));
    await tester.pumpAndSettle();
    expect(find.text('Create new issue'), findsOneWidget);
    await tester.enterText(
      find.byType(EditableText),
      'My first issue',
    );
    await tester.tap(find.text('SUBMIT'));
    await tester.pumpAndSettle();
    expect(find.text('CREATE'), findsOneWidget);
    expect(find.text('My first issue'), findsOneWidget);

    await tester.tap(find.text('CREATE'));
    await tester.pumpAndSettle();
    expect(find.text('Create new issue'), findsOneWidget);
    await tester.enterText(
      find.byType(EditableText),
      'My second issue',
    );
    await tester.tap(find.text('SUBMIT'));
    await tester.pumpAndSettle();
    expect(find.text('CREATE'), findsOneWidget);
    expect(find.text('My second issue'), findsOneWidget);
  });
}
