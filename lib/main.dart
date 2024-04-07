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
  // Sample HashMap with integers
  final Map<String, int> fighterData = {
    'Jon Jones': 35,
    'Max Holloway': 28,
    'Charles Olivera': 34,
    'Chama': 32,
    'Bobby Green': 40,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sales Line Chart'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column( // Add a Column widget
          children: [
            Expanded(
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      spots: fighterData.entries.map((entry) {
                        return FlSpot(fighterData.keys.toList().indexOf(entry.key).toDouble(), entry.value.toDouble()); 
                      }).toList(),
                      isCurved: false,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10), 
            const Text(
              'Date', 
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
