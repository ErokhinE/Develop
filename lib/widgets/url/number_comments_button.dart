import 'package:flutter/material.dart';

class NumberCommentsButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final Color color;
  final Color textColor;

  const NumberCommentsButton({super.key, required this.onTap, required this.text, required this.color, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 10, horizontal: 15)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        )),
        backgroundColor: MaterialStateProperty.all(color),
      ),
      onPressed: onTap,
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 20,
        ),
      ),
    );
  }
}
