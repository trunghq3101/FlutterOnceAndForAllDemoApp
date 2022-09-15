import 'package:flutter/material.dart';

import 'create_issue_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var issues = <String>[];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ColoredBox(
          color: Colors.white,
          child: SizedBox.expand(),
        ),
        ListView(
          children: issues.map((e) => Text(e)).toList(),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: UnconstrainedBox(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Builder(builder: (context) {
                return FloatingActionButton.extended(
                  onPressed: () async {
                    final newIssue = await Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => CreateIssuePage()),
                    );
                    setState(() {
                      issues.add(newIssue);
                    });
                  },
                  label: Text('Create'.toUpperCase()),
                  icon: Icon(Icons.add),
                  backgroundColor: Color(0xFF03DAC5),
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
