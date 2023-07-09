import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vibe_checker/screens/visualization_screen.dart';
import 'package:vibe_checker/widgets/analyze_button.dart';
import 'package:vibe_checker/widgets/logo.dart';
import 'package:vibe_checker/widgets/my_textfield.dart';
import 'package:vibe_checker/widgets/navigation_button.dart';
import 'package:vibe_checker/widgets/navbar.dart';

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
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: const BoxDecoration(color: Color(0xffEBDFD7)),
                    child: Center(
                      child: SizedBox(
                        height: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            NavigationPanel(onTap: () {}),
                            Container(
                              width: 930,
                              height: 590,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Colors.white.withOpacity(0.7),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 30),

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
                                  // logo
                                  // Logo(),

                                  const SizedBox(height: 85),

                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 45),
                                    child: MyTextField(
                                      controller: urlController,
                                      hintText: 'Youtube URL',
                                      obscure: false,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 70.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconButton(
                                            onPressed: () => showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    title: const Text(
                                                        'Number of comments'),
                                                    content: const Text(
                                                        'write number of comments'),
                                                    actions: [
                                                      TextButton(
                                                        child: const Text(
                                                            "Cancel"),
                                                        onPressed: () {},
                                                      ),
                                                      TextButton(
                                                        child:
                                                            const Text("Apply"),
                                                        onPressed: () {},
                                                      ),
                                                    ],
                                                  );
                                                }),
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
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  VisualizationScreen(
                                                    url: url,
                                                  )));
                                    }),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Positioned(
              top: 0,
              left: 15,
              child: Logo(),
            ),
          ],
        ),
      );
    });
  }
}
