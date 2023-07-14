import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final String header;
  final bool dark;
  const ErrorMessage({super.key, required this.header, required this.dark});

  @override
  Widget build(BuildContext context) {
    final Color textColor = dark ? Colors.white : Colors.black;
    final Color bgColor =
    dark ? const Color(0xff101F36) : Colors.white.withOpacity(0.7);
    final Color borderColor =
    dark ? const Color(0xff101F36) : const Color(0xffEBDFD7);
    const Color dividerColor = Color(0xffEBDFD7);

    return Container(
      height: 150,
      width: 600,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: borderColor),
        color: bgColor,
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Text(
            'Error',
            style: TextStyle(
              fontSize: 24,
              color: textColor,
            ),
          ),
          const SizedBox(height: 5),
          const Divider(
            height: 10,
            thickness: 2,
            color: dividerColor,
          ),
          const SizedBox(height: 10),
          Text(
            header,
            style: TextStyle(
              fontSize: 36,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
