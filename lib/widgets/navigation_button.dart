import 'package:flutter/material.dart';

class NavigationButton extends StatelessWidget {
  final Function()? onTap;
  final bool isRight;

  const NavigationButton({super.key, required this.onTap, required this.isRight});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.all(15)),
        shape: MaterialStateProperty.all(CircleBorder()),
        backgroundColor: MaterialStateProperty.all(Colors.white),
      ),
      onPressed: onTap,
      child: isRight ? Icon(Icons.keyboard_arrow_left, color: Colors.black,) : Icon(Icons.keyboard_arrow_right, color: Colors.black,)
    );
  }
}
