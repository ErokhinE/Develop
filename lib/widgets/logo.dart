import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Text(
              "VibeChecker",
              style: GoogleFonts.pacifico(
                  fontSize: 50,
                  shadows: <Shadow>[
                    const Shadow(
                      offset: Offset(0, 5),
                      blurRadius: 5.0,
                      color: Color(0xffF17474),
                    ),
                  ],
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 5
                    ..color = Colors.white),
            ),
            Text(
              "VibeChecker",
              style: GoogleFonts.pacifico(
                color: const Color(0xffF17474),
                fontSize: 50,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
