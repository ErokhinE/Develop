import 'package:flutter/material.dart';
import 'package:word_cloud/word_cloud.dart';

class WordCloud extends StatelessWidget {
  final WordCloudData wcData;
  final String header;
  final double width;
  final double height;
  const WordCloud({super.key, required this.wcData, required this.header, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xff101F36)),
        color: const Color(0xff101F36),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),

          Text(
            header,
            style: const TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 15),

          const Divider(
            height: 10,
            thickness: 2,
            color: Color(0xffEBDFD7),
          ),

          const SizedBox(height: 5),

          WordCloudView(
            data: wcData,
            mapwidth: width - 40,
            mapheight: height - 100,
            fontWeight: FontWeight.bold,
            maxtextsize: 80,
            mintextsize: 30,
            shape: WordCloudEllipse(majoraxis: 500, minoraxis: 350),
            colorlist: const [
              Colors.brown,
              Colors.amberAccent,
              Colors.white60,
            ],
          ),
        ],
      ),
    );
  }
}
