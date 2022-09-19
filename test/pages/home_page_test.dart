import 'package:flutter/material.dart';
import 'package:flutter_community/main.dart';
import 'package:flutter_community/models/issue.dart';
import 'package:flutter_community/pages/home_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomePage test', () {
    testWidgets('Verify integration with IssuesModel',
        (WidgetTester tester) async {
      issuesModel.issues = [];
      await tester.pumpWidget(const MaterialApp(
        home: HomePage(),
      ));
      expect(find.byType(IssueItem), findsNothing);
      issuesModel.issues = [
        IssueModel()..title = 'My first issue',
        IssueModel()..title = 'My second issue'
      ];
      await tester.pumpWidget(const MaterialApp(
        home: HomePage(),
      ));
      expect(find.byType(IssueItem), findsNWidgets(2));
    });
  });
}
