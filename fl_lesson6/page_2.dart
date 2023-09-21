import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Page 2'),
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
