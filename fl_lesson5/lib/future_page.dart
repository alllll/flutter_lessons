import 'dart:async';

import 'package:flutter/material.dart';

class FuturePage extends StatefulWidget {
  const FuturePage({super.key});

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  late final Future<String> future;

  @override
  void initState() {
    super.initState();

    future = Future.delayed(const Duration(seconds: 5), () => 'Future Result');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: FutureBuilder(
              future: future,
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const CircularProgressIndicator();
                return Text(
                  snapshot.data?.toString() ?? '',
                  style: const TextStyle(fontSize: 22),
                );
              }),
        ),
      ),
    );
  }
}
