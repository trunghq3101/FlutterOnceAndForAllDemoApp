class IssueModel {
  String _title = '';

  String get title => _title;

  set title(String title) {
    _title = title;
  }
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
