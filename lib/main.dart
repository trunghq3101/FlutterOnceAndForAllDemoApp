import 'package:flutter/material.dart';
import 'package:flutter_community/models/issue.dart';

import 'pages/home_page.dart';

var issuesModel = IssuesModel();

main() {
  runApp(
    const MaterialApp(
      home: HomePage(),
    ),
  );
}
