import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;

import 'package:path_provider/path_provider.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('PDF Generator App'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              // Generate PDF
              generatePDF();
            },
            child: const Text('Generate PDF'),
          ),
        ),
      ),
    );
  }

  void generatePDF() {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text('Hello World'),
          ); // Center
        },
      ),
    );

    // Save the PDF to a file
    savePDF(pdf);
  }

  Future<void> savePDF(pw.Document pdf) async {
    // Get external storage directory
    final dir = await getTemporaryDirectory();

    // Define the file path
    final file = File('${dir.path}/example.pdf');

    // Write the PDF to the file
    await file.writeAsBytes(await pdf.save());
  }
}
