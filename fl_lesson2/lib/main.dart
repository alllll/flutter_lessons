import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
    appBar: AppBar(
      title: const Text('Title'),
      actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
    ),
    body: const ColorContainer(
      color: Colors.white,
    ),
    floatingActionButton:
        IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
  )));
}

class ColorContainer extends StatefulWidget {
  const ColorContainer({super.key, required this.color});

  final Color color;

  @override
  State<ColorContainer> createState() => _ColorContainerState();
}

class _ColorContainerState extends State<ColorContainer> {
  late Color color;

  double textSize = 14;

  @override
  void initState() {
    super.initState();
    color = widget.color;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          color = Colors.green;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: color,
            child: Center(
              child: Text(
                'Test',
                style: TextStyle(
                    fontFamily: 'Montserrat-Medium', fontSize: textSize),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  textSize = textSize + 2;
                });
              },
              child: const Text('Увеличить')),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  textSize = textSize - 2;
                });
              },
              child: const Text('Уменьшить')),
        ],
      ),
    );
  }
}
