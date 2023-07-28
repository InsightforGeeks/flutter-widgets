import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('FlutterforGeeks'),
        ),
        body: HorizontalColorList(),
      ),
    );
  }
}

class HorizontalColorList extends StatelessWidget {
  final List<Color> colors = [
    Colors.teal,
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.teal
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: 300,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: colors.length,
          itemBuilder: (context, index) {
            return Container(
              width: 100,
              color: colors[index],
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
            );
          },
        ),
      ),
    );
  }
}
