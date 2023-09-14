import 'package:flutter/material.dart';

class ContainerDemo extends StatelessWidget {
  const ContainerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Colors.green,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Asdasd'),
      ),
    );
  }
}
