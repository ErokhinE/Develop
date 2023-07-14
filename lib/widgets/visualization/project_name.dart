import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProjectName extends StatelessWidget {
  final String header;
  final bool dark;

  const ProjectName({
    super.key,
    required this.header,
    required this.dark,
  });

  @override
  Widget build(BuildContext context) {
    const Color textColor = Colors.black;

    return SizedBox(
      height: 40,
      child: Row(
        children: [
          Text(
            header,
            style: const TextStyle(
              fontSize: 24,
              color: textColor,
            ),
          ),
          const SizedBox(width: 5),
          const Icon(
            CupertinoIcons.pencil_circle_fill,
            color: textColor,
          )
        ],
      ),
    );
  }
}
