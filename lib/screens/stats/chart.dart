import 'dart:math';
import 'package:fl_chart/fl_chart.dart';

import 'package:flutter/material.dart';

class MyChart extends StatefulWidget {
  const MyChart({super.key});
  @override
  State<MyChart> createState() => _MyChartState();
}

class _MyChartState extends State<MyChart> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0), // Add padding for better spacing
      child: BarChart(
        mainBarData(),
      ),
    );
  }

  BarChartGroupData makeGroupData(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).colorScheme.tertiary,
            ],
            transform: const GradientRotation(pi / 40),
          ),
          width: 20,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 5,
            color: Colors.grey.shade300,
          ),
        )
      ],
    );
  }

 List<BarChartGroupData> showingGroups() => List.generate(8, (i) {
        return makeGroupData(i, [2.0, 3.0, 2.0, 4.5, 3.8, 1.5, 4.0, 3.8][i]);
      });

  BarChartData mainBarData() {
    return BarChartData(
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 38,
            getTitlesWidget: getBottomTitles,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 38,
            getTitlesWidget: getLeftTitles,
          ),
        ),
      ),
      borderData: FlBorderData(show: false),
      gridData: const FlGridData(show: false),
      barGroups: showingGroups(),
    );
  }

  Widget getBottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );

    final labels = ['01', '02', '03', '04', '05', '06', '07', '08'];

    if (value.toInt() >= 0 && value.toInt() < labels.length) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0), // Add some spacing
        child: Text(labels[value.toInt()], style: style),
      );
    }

    return Container();
  }

  Widget getLeftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );

    final labels = {0: '1K', 2: '2K', 3: '3K', 4: '4K', 5: '5K'};

    if (labels.containsKey(value.toInt())) {
      return Padding(
        padding: const EdgeInsets.only(right: 8.0), // Adjust spacing
        child: Text(labels[value.toInt()]!, style: style),
      );
    }

    return Container();
  }
}