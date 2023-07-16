import 'package:demo12/screens/url_screen.dart';
import 'package:demo12/screens/visualization_screen.dart';
import 'package:demo12/widgets/footer.dart';
import 'package:demo12/widgets/instruction.dart';
import 'package:demo12/widgets/try_VibeChecker.dart';
import 'package:demo12/widgets/vibeCheckerLogo.dart';
import 'package:demo12/widgets/why_vibeChecker.dart';
import 'package:flutter/material.dart';
import 'package:demo12/widgets/logo.dart';
import 'package:demo12/widgets/navigation_button.dart';
import 'package:demo12/widgets/navbar.dart';

class AboutVibeCheckerScreen extends StatefulWidget {
  const AboutVibeCheckerScreen({super.key});

  @override
  State<AboutVibeCheckerScreen> createState() => AboutVibeCheckerScreenState();
}

class AboutVibeCheckerScreenState extends State<AboutVibeCheckerScreen> {
  final urlController = TextEditingController();
  var selectedIndex = 0;
  var numberOfComments = 30;
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
                  child: SingleChildScrollView(
                    child: Container(
                      height: 1700,
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      decoration: const BoxDecoration(color: Color(0xffEBDFD7)),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [ 
                            NavigationPanel(onTap: () {print('12413');}),
                            Container(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: const VibeCheckerLogo(),
                            ),
                            const WhyVibeChecker(),
                            const Instruction(),
                            const TryVibeChecker(),
                            const FooterTeam(),
                          ],
                        ),
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