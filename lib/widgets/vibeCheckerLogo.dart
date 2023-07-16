import 'package:flutter/material.dart';

class VibeCheckerLogo extends StatelessWidget {
  const VibeCheckerLogo({super.key});
  @override
  Widget build(BuildContext context) {
    const imageSocialNets = 'images/socialNets.jpg';
    return Container(
      width: 1301,
      height: 300,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromRGBO(250, 247, 245, 1),
          width: 5,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 594,
            height: 263,
            padding: const EdgeInsets.only(top: 70),
            child: const Text(
              "Step into the world of Viewer comments and become closer to your viewers. ",
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
            ),
          ),

          ClipRRect( 
            borderRadius: BorderRadius.circular(50),
            child: const Image(
              image: AssetImage(imageSocialNets),
              height: 400,
              width: 500,
            ),
          ),
        ],
      ),
    );
  }
}
