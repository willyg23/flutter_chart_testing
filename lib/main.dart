import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyLineChart(),
    );
  }
}

class MyLineChart extends StatefulWidget {
  @override
  _MyLineChartState createState() => _MyLineChartState();
}

class _MyLineChartState extends State<MyLineChart> {
  // Sample HashMap
  final Map<String, double> salesData = {
    'Jan': 35.0,
    'Feb': 28.0,
    'Mar': 34.0,
    'Apr': 32.0,
    'May': 40.0,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sales Line Chart'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: LineChart(
          LineChartData(
            lineBarsData: [
              LineChartBarData(
                spots: salesData.entries.map((entry) {
                  return FlSpot(salesData.keys.toList().indexOf(entry.key).toDouble(),  entry.value);
                }).toList(),
                isCurved: true, // For smooth lines
              ),
            ],
          ),
        ),
      ),
    );
  }
}
