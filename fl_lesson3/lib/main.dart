import 'dart:math';

import 'package:fl_lesson3/global_key.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: CounterPage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageTileState();
}

class _HomePageTileState extends State<HomePage> {
  late List<StatefullColorTile> tiles;

  @override
  void initState() {
    super.initState();
    tiles = <StatefullColorTile>[
      const StatefullColorTile(
        key: ValueKey<int>(1),
      ),
      const StatefullColorTile(key: ObjectKey('asdasd'))
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: tiles,
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: swapTiles,
          child: const Icon(
            Icons.switch_access_shortcut,
          )),
    );
  }

  void swapTiles() {
    setState(() {
      tiles.add(tiles.removeAt(0));
    });
  }
}

class StatefullColorTile extends StatefulWidget {
  const StatefullColorTile({
    super.key,
  });

  @override
  State<StatefullColorTile> createState() => _StatefullColorfulTileState();
}

class _StatefullColorfulTileState extends State<StatefullColorTile> {
  late Color color;

  @override
  void initState() {
    super.initState();
    color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Container(width: 100, height: 100, color: color);
  }
}
