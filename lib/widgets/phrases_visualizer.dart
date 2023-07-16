import 'package:flutter/material.dart';
import 'package:demo12/widgets/phrase_tile.dart';

class PhrasesVisualizer extends StatefulWidget {
  const PhrasesVisualizer({super.key});

  @override
  State<PhrasesVisualizer> createState() => _PhrasesVisualizerState();
}

class _PhrasesVisualizerState extends State<PhrasesVisualizer> {
  List<List<dynamic>>? csvData = [
    [1, 'amazing', 'positive', 6],
    [2, 'hate', 'negative', 4],
    [3,'love','positive',1],
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),

        const Row(
          children: [
            Expanded(child: Padding(
              padding: EdgeInsets.only(left: 70.0),
              child: Text(
                'Phrase',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            )),
            SizedBox(width: 20),
            Padding(
              padding: EdgeInsets.only(right: 50.0),
              child: Text(
                'Count',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),

        const Divider(
          height: 10,
          thickness: 2,
          color: Color(0xffEBDFD7),
        ),

        const SizedBox(height: 10),

        csvData == null
            ? const CircularProgressIndicator()
            : ListView.builder(
          itemCount: 3,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return PhraseTile(
              id: csvData?[index][0],
              phrase: csvData?[index][1],
              sentimentTag: csvData?[index][2],
              count: csvData?[index][3],
            );
          },
        ),
      ],
    );
  }
}
