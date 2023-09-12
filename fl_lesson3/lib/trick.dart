import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  final state = {"color": Colors.blue};

  TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stateless ??')),
      body: Center(
        child: GestureDetector(
            child: Container(
              width: 50.0,
              height: 50.0,
              color: state["color"]!,
            ),
            onTap: () {
              if (state['color'] == Colors.blue) {
                state['color'] = Colors.red;
              } else {
                state['color'] = Colors.blue;
              }
              if (context is Element) {
                (context).markNeedsBuild();
              }
            }),
      ),
    );
  }
}
