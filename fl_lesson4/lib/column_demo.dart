import 'package:flutter/material.dart';

class ColumnDemo extends StatelessWidget {
  const ColumnDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            flex: 30,
            child: Container(
              color: Colors.red,
            )),
        Expanded(
          flex: 70,
          child: Container(
            color: Colors.yellow,
          ),
        )
      ],
    );
  }
}
