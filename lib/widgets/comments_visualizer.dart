import 'package:flutter/material.dart';
import 'package:demo12/widgets/comment_tile.dart';

class CommentsVisualizer extends StatefulWidget {
  const CommentsVisualizer({super.key});

  @override
  State<CommentsVisualizer> createState() => _CommentsVisualizerState();
}

class _CommentsVisualizerState extends State<CommentsVisualizer> {
  List<List<dynamic>>? csvData = [
    [
      1,
      '"В тебе живет кусочек вот этого семилетнего обосранного ребенка" это гениально',
      'positive',
      5
    ],
    [2, '12:58 Папич момент', 'negative', 1],
    [
      3,
      '24:18 Нормальные парни молча солидарны и не донят на "задать вопрос за жознь" 💪💩',
      'positive',
      5
    ],
    [
      4,
      '24:20 Где нормальные парни? Литр, у них нет денег, да и проблем тоже.',
      'negative',
      1
    ],
    [
      5,
      'Later, если хочешь чтобы тебя не читали по шмоткам, тебе подойдёт стиль grey man, или normcore. Погугли как-нибудь на досуге',
      'negative',
      1
    ],
    [
      6,
      'Later, если хочешь чтобы тебя не читали по шмоткам, тебе подойдёт стиль grey man, или normcore. Погугли как-нибудь на досуге',
      'neutral',
      1
    ],
    [7, 'oh my god штанцы как у папани, только полосы желтые', 'negative', 1],
    [8, 'А можно гайд по чтению людей?', 'negative', 1],
    [
      9,
      'А че, литр со своей женщиной расстался? Че это он с другими женщинами разговаривает?',
      'negative',
      1
    ],
    [10, 'А я был на этом стриме хых ))', 'negative', 1],
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        csvData == null
            ? const CircularProgressIndicator()
            : ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return CommentTile(
                    id: csvData?[index][0],
                    comment: csvData?[index][1],
                    sentimentTag: csvData?[index][2],
                    sentimentRating: csvData?[index][3],
                  );
                },
              ),
      ],
    );
  }
}
