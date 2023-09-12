import 'package:flutter/material.dart';

final counterKey = GlobalKey<CounterState>();

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter: ${counterKey.currentState?.counter ?? 0}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                'Так как мы используем GlobalKey, мы можем получить доступ к стейту в любом месте дерева: ${counterKey.currentState?.counter ?? 0}'),
            Counter(key: counterKey),
            Counter(key: counterKey),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          setState(() {
            counterKey.currentState?.incrementCounter();
          });
        },
      ),
    );
  }
}

class Counter extends StatefulWidget {
  const Counter({
    super.key,
  });

  @override
  CounterState createState() => CounterState();
}

class CounterState extends State<Counter> {
  int counter = 0;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text('$counter');
  }
}
