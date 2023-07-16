import 'package:demo12/screens/visualization_screen.dart';
import 'package:demo12/widgets/contact_info.dart';
import 'package:demo12/widgets/footer.dart';
import 'package:flutter/material.dart';

import '../widgets/logo.dart';
import '../widgets/navbar.dart';
import '../widgets/navigation_button.dart';
import 'url_screen.dart';

class ContactUsScreen extends StatefulWidget {
  // final Function()? onTap;
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => ContactUsScreenState();
}

class ContactUsScreenState extends State<ContactUsScreen> {
  final urlController = TextEditingController();
  var selectedIndex = 0;
  var navigationIsOpen = false;
  late String url;
  

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Row(
              children: [
                SafeArea(
                  child: NavigationRail(
                    extended: navigationIsOpen,
                    backgroundColor: const Color(0xff101F36),
                    destinations: const [
                      NavigationRailDestination(
                        icon: Icon(Icons.search),
                        label: Text('Analyze'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.insert_chart),
                        label: Text('Visualization'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.layers),
                        label: Text('Projects'),
                      ),
                    ],
                    minExtendedWidth: 300,
                    selectedIndex: selectedIndex,
                    selectedLabelTextStyle:
                        const TextStyle(color: Colors.white),
                    selectedIconTheme: const IconThemeData(color: Colors.black),
                    unselectedLabelTextStyle:
                        TextStyle(color: Colors.grey.shade400),
                    unselectedIconTheme:
                        const IconThemeData(color: Colors.white),
                    useIndicator: true,
                    indicatorColor: const Color(0xffEBDFD7),
                    groupAlignment: -0.5,
                    leading: Padding(
                      padding: const EdgeInsets.only(top: 100.0),
                      child: NavigationButton(
                        onTap: () {
                          setState(() {
                            navigationIsOpen = navigationIsOpen ? false : true;
                          });
                        },
                        isRight: navigationIsOpen,
                      ),
                    ),
                    onDestinationSelected: (value) {
                      setState(() {
                        selectedIndex = value;
                      });
                      if (urlController.text != "") {
                        url = urlController.text;
                      }
                      if (selectedIndex == 0) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const UrlScreen()));
                      } else if (selectedIndex == 1) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => VisualizationScreen(
                                  url: url,
                                )));
                      }
                    },
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: 
                      const BoxDecoration(color: Color(0xffEBDFD7)),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          NavigationPanel(onTap: () {
                            print('12413');
                          }),
                          Container(
                            padding: const EdgeInsets.only(bottom: 100),
                            child:  
                              ContactInfo(onTap: () {  },),
                            ),
                          const FooterTeam(
                            
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Positioned(
              top: 10,
              left: 15,
              child: Logo(),
            ),
          ],
        ),
      );
    });
  }
}
