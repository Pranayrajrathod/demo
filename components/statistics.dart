import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class Statistics extends StatelessWidget {
  final Map<String, double> chartData;

  const Statistics({super.key, required this.chartData});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Statistics Overview',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            PieChart(
              dataMap: chartData,
              animationDuration: Duration(milliseconds: 800),
              chartType: ChartType.ring,
              colorList: [
                Colors.green,
                Colors.red,
                Colors.orange,
              ],
              legendOptions: LegendOptions(
                showLegends: true,
                legendPosition: LegendPosition.right,
              ),
            ),
          ],
        ),
      ),
    );
  }
}