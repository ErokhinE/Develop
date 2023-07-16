import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactInfo extends StatelessWidget {
  final Function()? onTap;

  const ContactInfo({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    const imageTeam = 'images/Team.jpg';

    return Container(
      width: 1301,
      height: 417,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: const Color.fromRGBO(239, 230, 224, 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container (
            child:  Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 50, top: 100),
                  width: 594,
                  height: 263,
                  child: const Text(
                    "This is the VibeCheker team! If you have any ideas for improving the site, interesting suggestions or bug reports, we'd love to hear from you!",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Row (
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 370,
                      height: 32,
                      child: const Text(
                        "By clicking the Write us button, you will be redirected to a Google form where you can leave your message",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    
                    ElevatedButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 25, vertical:20)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                        backgroundColor: MaterialStateProperty.all(Color(0xff220F58)),
                      ),
                      onPressed: () => launch('https://docs.google.com/forms/d/e/1FAIpQLSfxxxU1ka6zAomCBukmqLG9sZMba37F3yPWHm_7DMJ_o6TdjA/viewform'),
                      child: const Text(
                        "Write us",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child:const Image(
                image: AssetImage(imageTeam),
                height: 417,
                width: 570,
              ),
            )

          ),

        ],)
    );
  }
}
