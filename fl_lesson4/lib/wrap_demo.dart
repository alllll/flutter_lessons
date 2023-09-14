import 'package:flutter/material.dart';

class WrapDemo extends StatelessWidget {
  const WrapDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      spacing: 16,
      runSpacing: 16,
      children: [
        Container(
            color: Colors.blue,
            width: 200,
            height: 200,
            child: const Center(
                child: Text(
              "W1",
              textScaleFactor: 2,
            ))),
        Container(
            color: Colors.red,
            width: 200,
            height: 200,
            child: const Center(
                child: Text(
              "W2",
              textScaleFactor: 2,
            ))),
        Container(
            color: Colors.green,
            width: 200,
            height: 200,
            child: const Center(
                child: Text(
              "W3",
              textScaleFactor: 2,
            ))),
        Container(
            color: Colors.pinkAccent,
            width: 200,
            height: 200,
            child: const Center(
                child: Text(
              "W4",
              textScaleFactor: 2,
            ))),
        Container(
            color: Colors.orange,
            width: 200,
            height: 200,
            child: const Center(
                child: Text(
              "W5",
              textScaleFactor: 2,
            ))),
      ],
    );
  }
}
