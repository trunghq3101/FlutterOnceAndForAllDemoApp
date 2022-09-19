import 'package:flutter/material.dart';
import 'package:flutter_community/main.dart';
import 'package:flutter_community/models/issue.dart';

import 'create_issue_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const ColoredBox(
          color: Colors.white,
          child: SizedBox.expand(),
        ),
        ListView(
          children: issuesModel.issues.map((e) => IssueItem(issue: e)).toList(),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: UnconstrainedBox(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Builder(builder: (context) {
                return FloatingActionButton.extended(
                  onPressed: () async {
                    await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => CreateIssuePage(
                          issuesModel: issuesModel,
                        ),
                      ),
                    );
                    setState(() {});
                  },
                  label: Text('Create'.toUpperCase()),
                  icon: const Icon(Icons.add),
                  backgroundColor: const Color(0xFF03DAC5),
                  foregroundColor: Colors.black,
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}

class IssueItem extends StatelessWidget {
  const IssueItem({
    Key? key,
    required this.issue,
  }) : super(key: key);

  final IssueModel issue;

  @override
  Widget build(BuildContext context) {
    return Text(issue.title);
  }
}
