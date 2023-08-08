import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green.shade900),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "FlutterforGeeks",
            style: TextStyle(color: Colors.green),
          ),
        ),
        body: BottomSheetVarietiesApp(),
      ),
    );
  }
}

class BottomSheetVarietiesApp extends StatelessWidget {
  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          child: const Center(
            child: Text("Modal Bottom Sheet"),
          ),
        );
      },
    );
  }

  void _showPersistentBottomSheet(BuildContext context) {
    Scaffold.of(context).showBottomSheet(
      (BuildContext context) {
        return Container(
          height: 200,
          color: Colors.green,
          child: const Center(
            child: Text("Thanks For Watching Subscribe for more videos"),
          ),
        );
      },
    );
  }

  void _showModalBottomSheetWithTextFields(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Enter your details"),
              TextFormField(
                decoration: const InputDecoration(labelText: "Name"),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Email"),
              ),
              ElevatedButton(
                onPressed: () {
                  // Process form data
                  Navigator.pop(context);
                },
                child: const Text("Submit"),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showModalBottomSheetWithListTile(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: ListView(
            shrinkWrap: true,
            children: [
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text("Camera"),
                onTap: () {
                  // Handle camera selection
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo),
                title: const Text("Gallery"),
                onTap: () {
                  // Handle gallery selection
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              _showModalBottomSheet(context);
            },
            child: const Text("Show Modal Bottom Sheet"),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              _showPersistentBottomSheet(context);
            },
            child: const Text("Show Persistent Bottom Sheet"),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              _showModalBottomSheetWithTextFields(context);
            },
            child: const Text("Modal Bottom Sheet with Text Fields"),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              _showModalBottomSheetWithListTile(context);
            },
            child: const Text("Modal Bottom Sheet with List Tile"),
          ),
        ],
      ),
    );
  }
}
