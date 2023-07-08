import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final String header;
  const ErrorMessage({super.key, required this.header});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 600,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xff101F36)),
        color: const Color(0xff101F36),
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),
          const Text(
            'Error',
            style: TextStyle(
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
          const SizedBox(height: 10),
          Text(
            header,
            style: const TextStyle(
              fontSize: 36,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
