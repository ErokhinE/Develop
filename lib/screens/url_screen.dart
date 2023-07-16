import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:demo12/screens/visualization_screen.dart';
import 'package:demo12/widgets/analyze_button.dart';
import 'package:demo12/widgets/logo.dart';
import 'package:demo12/widgets/my_textfield.dart';
import 'package:demo12/widgets/navigation_button.dart';
import 'package:demo12/widgets/navbar.dart';

class UrlScreen extends StatefulWidget {
  const UrlScreen({super.key});

  @override
  State<UrlScreen> createState() => _UrlScreenState();
}

class _UrlScreenState extends State<UrlScreen> {
  final urlController = TextEditingController();
  var selectedIndex = 0;
  var numberOfComments = 30;
  var navigationIsOpen = false;
  late String url;

  void analyze() {}

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder ( builder: (context, constraints) {
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
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: const BoxDecoration(color: Color(0xffEBDFD7)),
                    child: Center(
                      child: Column(
                        
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [ 

                          NavigationPanel(onTap: () {print('12413');}),

                          Container(
                            width: 930,
                            height: 620,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.white.withOpacity(0.7),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(height: 70),

                                Container(

                                  alignment: Alignment.topLeft,
                                  padding: const EdgeInsets.only(left: 70),
                                  child: Text(
                                    'Welcome to VibeChecker',
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 20),

                                Container(
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.only(left: 70),
                                  child: Text(
                                    'Enter an url to analyze a video from Youtube',
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 28,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                

                                const SizedBox(height: 85),

                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 45),
                                  child: MyTextField(
                                    controller: urlController,
                                    hintText: 'Youtube URL',
                                    obscure: false,
                                  ),
                                ),

                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 70.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.tune)),
                                      Text('$numberOfComments comments'),
                                    ],
                                  ),
                                ),

                                const SizedBox(
                                  height: 20,
                                ),

                                Container(
                                  alignment: Alignment.topRight,
                                  padding: const EdgeInsets.only(right: 70),
                                  child: AnalyzeButton(onTap: () {
                                    url = urlController.text;
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => VisualizationScreen(
                                              url: url,
                                            )));
                                  }),
                                ),
                              ],
                            ),
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
