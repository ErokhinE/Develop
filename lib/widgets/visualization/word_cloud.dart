import 'package:flutter/material.dart';
import 'package:word_cloud/word_cloud.dart';

class WordCloud extends StatelessWidget {
  final WordCloudData wcData;
  final String header;
  final double width;
  final double height;
  final bool dark;

  const WordCloud({
    super.key,
    required this.wcData,
    required this.header,
    required this.width,
    required this.height,
    required this.dark,
  });

  @override
  Widget build(BuildContext context) {
    final Color textColor = dark ? Colors.white : Colors.black;
    final Color bgColor =
        dark ? const Color(0xff101F36) : Colors.white.withOpacity(0.7);
    final Color borderColor =
        dark ? const Color(0xff101F36) : const Color(0xffEBDFD7);
    const Color dividerColor = Color(0xffEBDFD7);

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: borderColor),
        color: bgColor,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            header,
            style: TextStyle(
              fontSize: 24,
              color: textColor,
            ),
          ),
          const SizedBox(height: 15),
          const Divider(
            height: 10,
            thickness: 2,
            color: dividerColor,
          ),
          const SizedBox(height: 5),
          WordCloudView(
            data: wcData,
            mapwidth: width - 40,
            mapheight: height - 100,
            fontWeight: FontWeight.bold,
            maxtextsize: 80,
            mintextsize: 40,
            shape: WordCloudEllipse(majoraxis: 500, minoraxis: 350),
            colorlist: [
              Colors.brown,
              Colors.amberAccent,
              dark ? Colors.white60 : Colors.black54,
            ],
          ),
        ],
      ),
    );
  }
}
