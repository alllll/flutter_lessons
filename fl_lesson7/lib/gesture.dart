import 'package:flutter/material.dart';

class GesturePage extends StatefulWidget {
  const GesturePage({super.key});

  @override
  State<GesturePage> createState() => _GesturePageState();
}

class _GesturePageState extends State<GesturePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Listener(
            onPointerDown: (event) {
              print(event);
            },
            onPointerUp: (event) {
              print(event);
            },
            onPointerMove: (event) {
              print(event);
            },
            child: Container(
              width: 200,
              height: 200,
              color: Colors.green,
            ),
          ),
          GestureDetector(
            onDoubleTap: () {
              print('Double Tap');
            },
            child: Container(
              width: 200,
              height: 200,
              color: Colors.red,
            ),
          )
        ],
      )),
    );
  }
}
