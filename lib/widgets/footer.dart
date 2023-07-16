import 'package:flutter/material.dart';

class FooterTeam extends StatelessWidget {
  const FooterTeam({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      child: const Text(
        "Created by VibeChecker team | 2023",
        style: TextStyle(
          color:  Color.fromRGBO(34, 15, 88, 1),
          fontSize: 20,
        ),
      ),
    );
  }
}
