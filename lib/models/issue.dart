class IssueModel {
  String title = '';
}

class IssuesModel {
  var issues = <IssueModel>[];

  IssueModel newBlankIssue() {
    return IssueModel();
  }

  void submit({required IssueModel issue}) {
    if (issue.title.isEmpty) return;
    issues.add(issue);
  }
}
