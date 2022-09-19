import 'package:flutter/material.dart';
import 'package:flutter_community/models/issue.dart';
import 'package:flutter_community/pages/create_issue_page.dart';
import 'package:flutter_test/flutter_test.dart';

class MockIssuesModel extends IssuesModel {
  var newBlankIssueCalled = 0;
  var submitCalled = 0;
  IssueModel? newBlankIssueResult;
  IssueModel? submitArgument;

  @override
  IssueModel newBlankIssue() {
    newBlankIssueCalled++;
    return newBlankIssueResult!;
  }

  @override
  void submit({required IssueModel issue}) {
    submitCalled++;
    submitArgument = issue;
  }
}

void main() {
  group('CreateIssuePage test', () {
    testWidgets('Verify integration with IssuesModel',
        (WidgetTester tester) async {
      final mockIssuesModel = MockIssuesModel();
      final newIssue = IssueModel();
      mockIssuesModel.newBlankIssueResult = newIssue;
      await tester.pumpWidget(MaterialApp(
        home: CreateIssuePage(issuesModel: mockIssuesModel),
      ));
      expect(mockIssuesModel.newBlankIssueCalled, 1);
      await tester.enterText(find.byKey(Key('title')), 'My first issue');
      expect(newIssue.title, 'My first issue');
      await tester.tap(find.text('SUBMIT'));
      expect(mockIssuesModel.submitCalled, 1);
      expect(mockIssuesModel.submitArgument, newIssue);
    });
  });
}
