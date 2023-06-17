import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class SentimentPieChart extends StatelessWidget {
  final Map<String, double> pieChartData;
  final String header;
  const SentimentPieChart({super.key, required this.pieChartData, required this.header});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),

          Text(
            header,
            style: const TextStyle(
              fontSize: 24,
            ),
          ),

          const SizedBox(height: 5),

          Divider(
            height: 10,
            thickness: 0.5,
            color: Colors.grey[500],
          ),

          const SizedBox(height: 35),

          PieChart(
            dataMap: pieChartData,
            chartType: ChartType.ring,
            ringStrokeWidth: 60,
            chartRadius: 200,
            colorList: const <Color>[
              Colors.green,
              Colors.red,
              Colors.amber,
            ],
            legendOptions: const LegendOptions(showLegends: false),
            chartValuesOptions: const ChartValuesOptions(
              showChartValueBackground: false,
              showChartValues: true,
              showChartValuesInPercentage: true,
              showChartValuesOutside: true,
              chartValueStyle: TextStyle(color: Colors.white),
              decimalPlaces: 1,
            ),
          ),
        ],
      ),
    );
  }
}
