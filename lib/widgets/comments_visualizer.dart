import 'package:flutter/material.dart';
import 'package:vibe_checker/widgets/comment_tile.dart';

class CommentsVisualizer extends StatefulWidget {
  final List<List<dynamic>>? analyzedData;
  const CommentsVisualizer({super.key, this.analyzedData});

  @override
  State<CommentsVisualizer> createState() => _CommentsVisualizerState();
}

class _CommentsVisualizerState extends State<CommentsVisualizer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         widget.analyzedData == []
            ? const CircularProgressIndicator()
            : ListView.builder(
                itemCount: widget.analyzedData?.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return CommentTile(
                    id: int.tryParse(widget.analyzedData?[index][0]),
                    comment: widget.analyzedData?[index][1],
                    sentimentTag: widget.analyzedData?[index][2],
                    sentimentRating: widget.analyzedData?[index][3],
                  );
                },
              ),
      ],
    );
  }
}
