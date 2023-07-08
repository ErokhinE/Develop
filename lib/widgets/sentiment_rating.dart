import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SentimentRating extends StatelessWidget {
  final double rating;
  final String header;
  const SentimentRating(
      {super.key, required this.rating, required this.header});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 130,
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
          const SizedBox(height: 5),
          const Divider(
            height: 10,
            thickness: 2,
            color: Color(0xffEBDFD7),
          ),
          const SizedBox(height: 5),
          RatingBarIndicator(
            rating: rating,
            itemCount: 4,
            itemBuilder: (context, index) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            itemSize: 50,
          ),
        ],
      ),
    );
  }
}
