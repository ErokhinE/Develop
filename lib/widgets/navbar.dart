import 'package:flutter/material.dart';

class NavigationPanel extends StatelessWidget {
  final Function()? onTap;
  
  const NavigationPanel({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(45),
      width: 1000,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color:  Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          
          ElevatedButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.only(left: 50)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
              backgroundColor: MaterialStateProperty.all(Color(0xffffff)),
              elevation: MaterialStatePropertyAll(0),
            ),

            onPressed: onTap,
            child: Text(
              "About us",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          
          ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
              backgroundColor: MaterialStateProperty.all(Color(0xffffff)),
              elevation: MaterialStatePropertyAll(0),
            ),
            onPressed: onTap,
            child: Text(
              "Pricing",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),

          ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
              backgroundColor: MaterialStateProperty.all(Color(0xffffff)),
              elevation: MaterialStatePropertyAll(0),
            ),
            onPressed: onTap,
            child: Text(
              "Contact us",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),

          ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
              backgroundColor: MaterialStateProperty.all(Color(0xffffff)),
              elevation: MaterialStatePropertyAll(0),
            ),
            onPressed: onTap,
            child: Text(
              "EN",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),

          ElevatedButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.only(right: 50)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
              backgroundColor: MaterialStateProperty.all(Color(0xffffff)),
              elevation: MaterialStatePropertyAll(0),
            ),
            onPressed: onTap,
            child: Text(
              "RUS",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ], 
      ),
    );
  }
}
