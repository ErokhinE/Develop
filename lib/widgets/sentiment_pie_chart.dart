import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class SentimentPieChart extends StatelessWidget {
  final Map<String, double> pieChartData;
  final String header;
  const SentimentPieChart({super.key, required this.pieChartData, required this.header});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 290,
      width: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xff101F36)),
        color: const Color(0xff101F36),
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),

          Text(
            header,
            style: const TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 5),

          const Divider(
            height: 10,
            thickness: 2,
            color: Color(0xffEBDFD7),
          ),

          const SizedBox(height: 35),

          PieChart(
            dataMap: pieChartData,
            chartType: ChartType.ring,
            ringStrokeWidth: 60,
            chartRadius: 140,
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
