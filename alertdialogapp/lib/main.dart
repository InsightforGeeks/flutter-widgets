import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter For Geeks',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.green.shade800, primary: Colors.green.shade700),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter For Geeks'),
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
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () => {
                      showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                                title: const Text("Welcome"),
                                content:
                                    const Text("Thank you for using our app!"),
                                actions: [
                                  TextButton(
                                    child: const Text("OK"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              ))
                    },
                child: const Text('Simple Alert Dialog')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () => {
                      showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                                title: const Text("Delete File"),
                                content: const Text(
                                    "Are you sure you want to delete this file?"),
                                actions: [
                                  TextButton(
                                    child: const Text("Cancel"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  TextButton(
                                    child: const Text("Delete"),
                                    onPressed: () {
                                      // Perform the delete action here
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              ))
                    },
                child: const Text('Confirmation Dialog')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () => {
                      showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                                title: const Text("Enter your name"),
                                content: const TextField(
                                    // Controller and other TextField properties can be added here
                                    ),
                                actions: [
                                  TextButton(
                                    child: const Text("Submit"),
                                    onPressed: () {
                                      // Process the entered data here
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              ))
                    },
                child: const Text('Input Dialog'))
          ],
        ),
      ),
    );
  }
}
