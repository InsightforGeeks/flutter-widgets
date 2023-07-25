import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const ChipSelectionScreen(),
    );
  }
}

class ChipSelectionScreen extends StatefulWidget {
  const ChipSelectionScreen({super.key});

  @override
  _ChipSelectionScreenState createState() => _ChipSelectionScreenState();
}

class _ChipSelectionScreenState extends State<ChipSelectionScreen> {
  List<String> sports = [
    'Football',
    'Basketball',
    'Tennis',
    'Baseball',
    'Cricket',
    'Swimming',
    'Running',
  ];
  List<String> selectedSports = [];

  void toggleSportSelection(String sport) {
    setState(() {
      if (selectedSports.contains(sport)) {
        selectedSports.remove(sport);
      } else {
        selectedSports.add(sport);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FlutterforGeeks'),
        backgroundColor: Colors.green.shade300,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Horizontal ListView',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 80,
            child: ListView.builder(
              itemCount: sports.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final sport = sports[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ChoiceChip(
                    label: Text(sport),
                    selected: selectedSports.contains(sport),
                    onSelected: (isSelected) => toggleSportSelection(sport),
                  ),
                );
              },
            ),
          ),
          const Text(
            'Vertical ListView',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 500,
            child: ListView.builder(
              itemCount: sports.length,
              itemBuilder: (context, index) {
                final sport = sports[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ChoiceChip(
                    label: Text(sport),
                    selected: selectedSports.contains(sport),
                    onSelected: (isSelected) => toggleSportSelection(sport),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
