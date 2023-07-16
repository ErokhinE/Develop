import 'package:flutter/material.dart';

class Instruction extends StatelessWidget {
  const Instruction({super.key});

  @override
  Widget build(BuildContext context) {
    const imageYouTube = "images/youtube.png";
    const imageRobot = "images/robot.png";
    const imageAnalysis = "images/analysis.png";

    return Container(
      width: 1301,
      height: 350,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: const Text(
              "How should this product be used?",
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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  width: 268,
                  height: 289,
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: const Text(
                          "First step",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        child: const ClipRRect( 
                          child: Image(
                            image: AssetImage(imageYouTube),
                          ),
                        ),
                      ),
                      Container(
                        width: 200,
                        child: const Text(
                          "Enter an URL to the video you want to analyze",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  )),
              
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                width: 268,
                height: 289,
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: const Text(
                        "Second step",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      child: const ClipRRect( 
                        child: Image(
                          image: AssetImage(imageRobot),
                        ),
                      ),
                    ),
                    Container(
                      width: 200,
                      child: const Text(
                        "Out product analyzes your video comments",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                )
              ),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                width: 268,
                height: 289,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(),
                      child: const Text(
                        "Third step",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(),
                      child: const ClipRRect( 
                        child: Image(
                          image: AssetImage(imageAnalysis),
                        ),
                      ),
                    ),
                    Container(
                      width: 200,
                      child: const Text(
                        "You get visual analytics in seconds",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                )
              ),
            ],
          )
        ],
      ),
    );
  }
}
