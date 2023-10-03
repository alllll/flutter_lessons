import 'package:fl_lesson9/util.dart';
import 'package:flutter/material.dart';

class StateFulPage extends StatefulWidget {
  const StateFulPage({super.key});

  @override
  State<StateFulPage> createState() => _StateFulPageState();
}

class _StateFulPageState extends State<StateFulPage> {
  Color? color;

  @override
  void initState() {
    super.initState();
    color = Util.randomColor();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
            child: Container(
          width: 200,
          height: 200,
          color: color,
          child: Column(
            children: [
              Text(color.toString()),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      color = Util.randomColor();
                    });
                  },
                  child: const Text('Change color')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/second');
                  },
                  child: const Text('Second Page'))
            ],
          ),
        )),
      ),
    );
  }
}
