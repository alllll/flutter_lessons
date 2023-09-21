import 'package:flutter/material.dart';
import 'package:neoflex_app/page.dart';

class App1 extends StatelessWidget {
  const App1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Builder(
          builder: (context) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () async {
                      final String? result =
                          await Navigator.of(context).push<String>(
                        MaterialPageRoute(
                          builder: (context) => const Page1(title: 'New title'),
                        ),
                      );

                      print(result);
                    },
                    child: const Text('Open Page 1'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
