import 'dart:math';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterforGeeks',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/line_chart': (context) => LineChartSample(),
        '/bar_chart': (context) => BarChartSample()
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FlutterforGeeks')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/line_chart');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.green, // Change the background color here
              ),
              child: const Text('Go to Line Chart'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/bar_chart');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.green, // Change the background color here
              ),
              child: const Text('Go to Bar Chart'),
            ),
          ],
        ),
      ),
    );
  }
}

class LineChartSample extends StatelessWidget {
  final List<charts.Series<LinearSales, int>> seriesList = [
    charts.Series<LinearSales, int>(
      id: 'Sales',
      colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
      domainFn: (LinearSales sales, _) => sales.year,
      measureFn: (LinearSales sales, _) => sales.sales,
      data: [
        LinearSales(0, 5),
        LinearSales(1, 12),
        LinearSales(2, 32),
        LinearSales(3, 17),
        LinearSales(4, 43),
        LinearSales(5, 51),
        LinearSales(6, 41),
      ],
    ),
  ];
  var axis = const charts.NumericAxisSpec(
      renderSpec: charts.GridlineRendererSpec(
    lineStyle: charts.LineStyleSpec(color: charts.MaterialPalette.white),
    labelStyle:
        charts.TextStyleSpec(fontSize: 10, color: charts.MaterialPalette.white),
  ));

  LineChartSample({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FlutterforGeeks')),
      body: Column(
        children: [
          SizedBox(
            height: 300,
            child: charts.LineChart(
              seriesList,
              animate: true,
              primaryMeasureAxis: axis,
              domainAxis: axis,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Line Chart Sample',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}

// Import statements and MyApp class definition remain the same

class BarChartSample extends StatelessWidget {
  final List<charts.Series<OrdinalSales, String>> seriesList = [
    charts.Series<OrdinalSales, String>(
      id: 'Sales',
      colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
      domainFn: (OrdinalSales sales, _) => sales.year,
      measureFn: (OrdinalSales sales, _) => sales.sales,
      data: [
        OrdinalSales('2017', 15),
        OrdinalSales('2018', 25),
        OrdinalSales('2019', 50),
        OrdinalSales('2020', 80),
      ],
    ),
  ];
  var axis = const charts.NumericAxisSpec(
      renderSpec: charts.GridlineRendererSpec(
    // lineStyle: charts.LineStyleSpec(color: charts.MaterialPalette.black),
    labelStyle:
        charts.TextStyleSpec(fontSize: 10, color: charts.MaterialPalette.white),
  ));
  var axi = const charts.OrdinalAxisSpec(
      renderSpec: charts.SmallTickRendererSpec(

          // Tick and Label styling here.
          labelStyle: charts.TextStyleSpec(
              fontSize: 18, // size in Pts.
              color: charts.MaterialPalette.white),

          // Change the line colors to match text color.
          lineStyle:
              charts.LineStyleSpec(color: charts.MaterialPalette.white)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FlutterforGeeks')),
      body: Column(
        children: [
          SizedBox(
            height: 400,
            child: charts.BarChart(
              seriesList,
              domainAxis: axi,
              primaryMeasureAxis: const charts.NumericAxisSpec(
                  renderSpec: charts.GridlineRendererSpec(

                      // Tick and Label styling here.
                      labelStyle: charts.TextStyleSpec(
                          fontSize: 18, // size in Pts.
                          color: charts.MaterialPalette.white),

                      // Change the line colors to match text color.
                      lineStyle: charts.LineStyleSpec(
                          color: charts.MaterialPalette.white))),
              animate: true,
              vertical: true,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Bar Chart Sample',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
