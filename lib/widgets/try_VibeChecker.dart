import 'package:demo12/screens/url_screen.dart';
import 'package:flutter/material.dart';

class TryVibeChecker extends StatelessWidget {
  const TryVibeChecker({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1301,
      height: 300,
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 400,
            child: const Text(
              "THIS IS EASY, RIGHT?",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w400,
                color:  Color.fromRGBO(66, 133, 244, 1),
              ),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 25, vertical:20)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
              backgroundColor: MaterialStateProperty.all(const Color(0xff220F58)),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UrlScreen()),
              );
            },
            child: const Text(
              "Try to analyze",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
