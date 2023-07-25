import 'package:flutter/material.dart';
import 'package:flutter_marquee/flutter_marquee.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterforGeeks',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green.shade900),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'FlutterforGeeks'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Marquee(
                  str:
                      'Welcome to Flutter Marquee! Scroll your text with style.',
                  containerWidth: 300,
                  textStyle: TextStyle(
                      color: Colors.green.shade900,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  baseMilliseconds: 10000),
            )
          ],
        ),
      ),
    );
  }
}
