// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import 'drawer.dart';

class AnimiaResult extends StatefulWidget {
  // final String result;
  // AnimiaResult(required this.result);
  const AnimiaResult({Key? key, required this.result}) : super(key: key);

  final String result;

  @override
  State<AnimiaResult> createState() => _AnimiaResultState();
}

class _AnimiaResultState extends State<AnimiaResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: DefaultDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text('Animia Result'),
      ),
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Center(
            child: Text(
              'Anemia Test Result',
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            widget.result.toString(),
            style: TextStyle(fontSize: 25.0),
          ),
        ],
      ),
    );
  }
}
