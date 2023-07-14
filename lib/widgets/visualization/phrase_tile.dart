import 'package:flutter/material.dart';

class PhraseTile extends StatelessWidget {
  final String phrase;
  final String sentimentTag;
  final int id;
  final int count;

  // final String keyWords;

  const PhraseTile({
    super.key,
    required this.phrase,
    required this.sentimentTag,
    required this.count,
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
          color: getColor().withOpacity(0.5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Text(
              '$id',
              style: const TextStyle(
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
              phrase,
              style: const TextStyle(
                decoration: TextDecoration.none,
                color: Colors.white,
                fontSize: 14,
              ),
            )),
            const SizedBox(
              width: 20,
            ),
            Text(
              '$count',
              style: const TextStyle(
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
