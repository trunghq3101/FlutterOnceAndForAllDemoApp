import 'package:flutter/material.dart';

var title = '';

class CreateIssuePage extends StatelessWidget {
  const CreateIssuePage({Key? key}) : super(key: key);

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
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              onChanged: ((value) {
                title = value;
              }),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(title);
            },
            child: Text('Submit'.toUpperCase()),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
