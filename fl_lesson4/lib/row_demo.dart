import 'package:flutter/material.dart';

class RowDemo extends StatelessWidget {
  const RowDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 200),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(width: 100, height: 200, color: Colors.green),
          Container(width: 100, height: 100, color: Colors.red),
          Container(width: 100, height: 100, color: Colors.yellow),
        ],
      ),
    );
  }
}
