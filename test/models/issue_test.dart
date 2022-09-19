import 'package:flutter_community/models/issue.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('IssuesModel test', () {
    test('User created issue, issues list should add a new issue', () {
      final issuesModel = IssuesModel();
      expect(issuesModel.issues, []);
      final newIssue = issuesModel.newBlankIssue();
      newIssue.title = 'My first issue';
      issuesModel.submit(issue: newIssue);
      expect(issuesModel.issues, [newIssue]);
    });

    test(
        'User created issue with empty title, issues list should not be changed',
        () {
      final issuesModel = IssuesModel();
      expect(issuesModel.issues, []);
      final newIssue = issuesModel.newBlankIssue();
      newIssue.title = '';
      issuesModel.submit(issue: newIssue);
      expect(issuesModel.issues, []);
    });
  });
}
