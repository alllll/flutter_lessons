import 'package:flutter/material.dart';

const double textSize = 22;

class ListViewDemo extends StatelessWidget {
  const ListViewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 200,
      itemBuilder: (context, index) {
        print(index);
        return Text('Item # $index');
      },
    );
  }
}
