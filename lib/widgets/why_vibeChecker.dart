import 'package:flutter/material.dart';

class WhyVibeChecker extends StatelessWidget {
  const WhyVibeChecker({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1301,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: const Color.fromRGBO(239, 230, 224, 1),
      ),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 25),
            child: const Text(
              "Why do you need to use our product?",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),

          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 50),
                width: 345,
                height: 180,
                child: const Text(
                  "1. You are a blogger and it is important for you to know people's opinion about your videos",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),

              Container(
                width:  345,
                height: 180,
                child: const Text(
                  "2. You are a beginner blogger and you want to understand your future audience",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),

              ),

              Container(
                width:  345,
                height: 180,
                padding: const EdgeInsets.only(right: 50),
                child: const Text(
                  "3. You are an ordinary user and you are wondering why some video gets so many likes, while another is covered only by haters",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),

              ),
          ],)
        ],
      ),
    );
  }
}
