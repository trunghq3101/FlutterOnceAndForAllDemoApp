import 'package:flutter/material.dart';

main() {
  runApp(
    MaterialApp(
      home: Stack(
        children: [
          ColoredBox(
            color: Colors.white,
            child: SizedBox.expand(),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: UnconstrainedBox(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: FloatingActionButton.extended(
                  onPressed: () {},
                  label: Text('Create'.toUpperCase()),
                  icon: Icon(Icons.add),
                  backgroundColor: Color(0xFF03DAC5),
                  foregroundColor: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
