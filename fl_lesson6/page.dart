import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          children: [
            Text('Page 1 - $title'),
            ElevatedButton(
              onPressed: () async {
                Navigator.of(context).pop('Result 123');
              },
              child: const Text('Return'),
            ),
          ],
        ),
      ),
    );
  }
}
