import 'package:flutter/material.dart';

class AnalyzeButton extends StatelessWidget {
  final Function()? onTap;

  const AnalyzeButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 45, vertical:30)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        )),
        backgroundColor: MaterialStateProperty.all(Color(0xff220F58)),
      ),
      onPressed: onTap,
      child: Text(
        "Analyze",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
