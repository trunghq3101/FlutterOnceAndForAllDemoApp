import 'package:flutter/material.dart';
import 'package:flutter_community/models/issue.dart';

class CreateIssuePage extends StatefulWidget {
  const CreateIssuePage({
    Key? key,
    required this.issuesModel,
  }) : super(key: key);

  final IssuesModel issuesModel;

  @override
  State<CreateIssuePage> createState() => _CreateIssuePageState();
}

class _CreateIssuePageState extends State<CreateIssuePage> {
  late IssueModel _newIssue;

  @override
  void initState() {
    super.initState();
    _newIssue = widget.issuesModel.newBlankIssue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create new issue'),
      ),
      body: Column(
        children: [
          Expanded(
            child: TextField(
              key: Key('title'),
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              onChanged: ((value) {
                _newIssue.title = value;
              }),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              widget.issuesModel.submit(issue: _newIssue);
              Navigator.of(context).pop();
            },
            child: Text('Submit'.toUpperCase()),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
