import 'package:flutter/material.dart';

class NavigationButton extends StatelessWidget {
  final Function()? onTap;
  final bool isRight;

  const NavigationButton(
      {super.key, required this.onTap, required this.isRight});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
          shape: MaterialStateProperty.all(const CircleBorder()),
          backgroundColor: MaterialStateProperty.all(Colors.white),
        ),
        onPressed: onTap,
        child: isRight
            ? const Icon(
                Icons.keyboard_arrow_left,
                color: Colors.black,
              )
            : const Icon(
                Icons.keyboard_arrow_right,
                color: Colors.black,
              ));
  }
}
