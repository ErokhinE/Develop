import 'package:flutter/material.dart';
import 'package:vibe_checker/widgets/visualization/phrase_tile.dart';

class PhrasesVisualizer extends StatefulWidget {
  final List<List<dynamic>>? wordListData;
  final bool dark;

  const PhrasesVisualizer({super.key, this.wordListData, required this.dark});

  @override
  State<PhrasesVisualizer> createState() => _PhrasesVisualizerState();
}

class _PhrasesVisualizerState extends State<PhrasesVisualizer> {
  List<List<dynamic>>? csvData = [
    [1, 'amazing', 'positive', 6],
    [2, 'hate', 'negative', 4],
    [3, 'love', 'positive', 1],
  ];

  @override
  Widget build(BuildContext context) {
    final Color textColor = widget.dark ? Colors.white : Colors.black;

    return Column(
      children: [
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(left: 70.0),
              child: Text(
                'Phrase',
                style: TextStyle(
                  color: textColor,
                  fontSize: 20,
                ),
              ),
            )),
            const SizedBox(width: 20),
            Padding(
              padding: const EdgeInsets.only(right: 50.0),
              child: Text(
                'Count',
                style: TextStyle(
                  color: textColor,
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
                  return PhraseTile(
                    id: index + 1,
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
