import 'package:flutter/material.dart';
import 'package:vibe_checker/widgets/phrase_tile.dart';

class PhrasesVisualizer extends StatefulWidget {
  final List<List<dynamic>>? wordListData;
  const PhrasesVisualizer({super.key, this.wordListData});

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

        widget.wordListData == []
            ? const CircularProgressIndicator()
            : ListView.builder(
          itemCount: widget.wordListData?.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            print(widget.wordListData?[index]);
            print(index);
            print(widget.wordListData?[9]);
            return PhraseTile(
              id: index+1,
              phrase: widget.wordListData?[index][0],
              sentimentTag: widget.wordListData?[index][3],
              count: widget.wordListData?[index][1],
            );
          },
        ),
      ],
    );
  }
}
