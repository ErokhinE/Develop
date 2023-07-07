import 'package:flutter/material.dart';

class CommentTile extends StatelessWidget {
  final String comment;
  final String sentimentTag;
  final int? id;
  final double sentimentRating;

  // final String keyWords;

  CommentTile({
    super.key,
    required this.comment,
    required this.sentimentTag,
    required this.sentimentRating,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    Color getColor() {
      if (sentimentTag == 'positive') {
        return Colors.green;
      } else if (sentimentTag == "negative") {
        return Colors.red;
      } else {
        return Colors.amber;
      }
    }

    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25),
      child: Container(
        padding: const EdgeInsets.only(
          right: 24,
          left: 24,
          top: 12,
          bottom: 12,
        ),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Text(
              '$id',
              style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
                child: Text(
              comment,
              style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.white,
                fontSize: 14,
                height: 1.5,
              ),
            )),
            const SizedBox(
              width: 20,
            ),
            Text(
              sentimentTag,
              style: TextStyle(
                color: getColor(),
                decoration: TextDecoration.none,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              'Rating: $sentimentRating',
              style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
