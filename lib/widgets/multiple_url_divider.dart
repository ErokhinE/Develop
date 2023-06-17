import 'package:flutter/material.dart';
import 'package:demo12/screens/multiple_url_screen.dart';


class MultipleUrlDivider extends StatelessWidget {
  const MultipleUrlDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Divider(
              thickness: 0.5,
              color: Colors.grey[500],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const MultipleUrlScreen()));
          },
          child: const Text('Multiple URLs'),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Divider(
              thickness: 0.5,
              color: Colors.grey[500],
            ),
          ),
        ),
      ],
    );
  }
}
