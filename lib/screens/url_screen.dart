import 'package:flutter/material.dart';
import 'package:vibe_checker/screens/visualization_screen.dart';
import 'package:vibe_checker/widgets/url/analyze_button.dart';
import 'package:vibe_checker/widgets/url/my_textfield.dart';
import 'package:vibe_checker/widgets/navigation/navbar.dart';
import 'package:vibe_checker/widgets/url/number_comments_button.dart';
import 'package:vibe_checker/widgets/url/number_comments_textfield.dart';
import 'package:vibe_checker/widgets/navigation/side_navbar.dart';

class UrlScreen extends StatefulWidget {
  final String? url;
  const UrlScreen({super.key, this.url});

  @override
  State<UrlScreen> createState() => _UrlScreenState();
}

class _UrlScreenState extends State<UrlScreen> {
  final urlController = TextEditingController();
  final numberCommentsController = TextEditingController();
  var selectedIndex = 0;
  var numberOfComments = 30;
  var navigationIsOpen = false;
  late String url = '';

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Row(
            children: [
              SideNavBar(url: url == '' ? widget.url : url, controller: urlController, index: 0, numberOfComments: numberOfComments,),
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
                                  child: const Text(
                                    'Welcome to VibeChecker',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 20),

                                Container(
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.only(left: 70),
                                  child: const Text(
                                    'Enter an url to analyze a video from Youtube',
                                    style: TextStyle(
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
                                                  shape: const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  15))),
                                                  title: const Text(
                                                    'Number of comments',
                                                    textAlign:
                                                        TextAlign.center,
                                                  ),
                                                  content:
                                                      NumberOfCommentsTextfield(
                                                    controller:
                                                        numberCommentsController,
                                                    numberOfComments:
                                                        numberOfComments,
                                                  ),
                                                  actions: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets
                                                              .only(
                                                              left: 15,
                                                              right: 15,
                                                              bottom: 25),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          NumberCommentsButton(
                                                            onTap: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            text: 'Cancel',
                                                            color:
                                                                Colors.white,
                                                            textColor:
                                                                const Color(
                                                                    0xff818181),
                                                          ),
                                                          NumberCommentsButton(
                                                            onTap: () {
                                                              setState(() {
                                                                numberOfComments =
                                                                    int.parse(
                                                                        numberCommentsController
                                                                            .text);
                                                                numberCommentsController
                                                                    .clear();
                                                              });
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            text: 'Apply',
                                                            color: const Color(
                                                                0xff220F58),
                                                            textColor:
                                                                Colors.white,
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                  alignment: Alignment.center,
                                                  actionsAlignment:
                                                      MainAxisAlignment
                                                          .center,
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
                                                  numberOfComments: numberOfComments,
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
        ),
      );
    });
  }
}
