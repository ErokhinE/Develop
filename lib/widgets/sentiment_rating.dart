import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SentimentRating extends StatelessWidget {
  final double rating;
  final String header;
  const SentimentRating({super.key, required this.rating, required this.header});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.grey.shade300),
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
            ),
          ),

          const SizedBox(height: 5),

          Divider(
            height: 10,
            thickness: 0.5,
            color: Colors.grey[500],
          ),

          const SizedBox(height: 5),

          RatingBarIndicator(
            rating: rating,
            itemCount: 5,
            itemBuilder: (context, index) =>
                const Icon(
                  Icons.star_border,
                  color: Colors.amber,
                ),
            itemSize: 50,
          ),

        ],
      ),
    );
  }
}
