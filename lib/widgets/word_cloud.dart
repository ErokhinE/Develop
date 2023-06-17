import 'package:flutter/material.dart';
import 'package:word_cloud/word_cloud.dart';

class WordCloud extends StatelessWidget {
  final WordCloudData wcData;
  final String header;
  const WordCloud({super.key, required this.wcData, required this.header});

  @override
  Widget build(BuildContext context) {
    return Container(
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

          WordCloudView(
            data: wcData,
            mapcolor: Colors.white12,
            mapwidth: 350,
            mapheight: 350,
            fontWeight: FontWeight.bold,
            colorlist: const [
              Colors.black,
              Colors.redAccent,
              Colors.indigoAccent
            ],
            shape: WordCloudCircle(radius: 250),
          ),
        ],
      ),
    );
  }
}
