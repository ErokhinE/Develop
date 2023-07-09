import 'dart:convert';

import 'package:vibe_checker/screens/url_screen.dart';
import 'package:flutter/material.dart';

import 'package:vibe_checker/widgets/comments_visualizer.dart';
import 'package:vibe_checker/widgets/error.dart';
import 'package:vibe_checker/widgets/navigation_button.dart';
import 'package:vibe_checker/widgets/number_comments.dart';
import 'package:vibe_checker/widgets/number_phrases.dart';
import 'package:vibe_checker/widgets/phrases_visualizer.dart';
import 'package:vibe_checker/widgets/sentiment_pie_chart.dart';
import 'package:vibe_checker/widgets/sentiment_rating.dart';
import 'package:vibe_checker/widgets/word_cloud.dart';
import 'package:word_cloud/word_cloud_data.dart';
import 'package:http/http.dart' as http;

class VisualizationScreen extends StatefulWidget {
  final String url;

  const VisualizationScreen({super.key, required this.url});

  @override
  State<VisualizationScreen> createState() => _VisualizationScreenState();
}

class _VisualizationScreenState extends State<VisualizationScreen> {
  // data for comments
  // late bool _isLoading;
  var _selectedIndexNavBar = 1;
  var _navigationIsOpen = false;
  List<List<dynamic>> analyzedDataComments = [];
  double overallRating = 2.75;
  late Future<Map<String, double>> _futureComments;
  late Future<String> _futureWordCloud;
  List<List<dynamic>> phraseList = [];
  Map<String, double> pieChartData = {
    "Positive": 1,
    "Negative": 1,
    "Neutral": 1,
  };

  late WordCloudData wordCloudData;

  List<Map> wordList = [
    {'word': 'Apple', 'value': 100},
    {'word': 'Samsung', 'value': 60},
    {'word': 'Intel', 'value': 55},
    {'word': 'Tesla', 'value': 50},
    {'word': 'AMD', 'value': 40},
    {'word': 'Google', 'value': 35},
    {'word': 'Qualcom', 'value': 31},
    {'word': 'Netflix', 'value': 27},
    {'word': 'Meta', 'value': 27},
    {'word': 'Amazon', 'value': 26},
    {'word': 'Nvidia', 'value': 25},
    {'word': 'Microsoft', 'value': 25},
    {'word': 'TSMC', 'value': 24},
    {'word': 'PayPal', 'value': 24},
    {'word': 'AT&T', 'value': 24},
    {'word': 'Oracle', 'value': 23},
    {'word': 'Unity', 'value': 23},
    {'word': 'Roblox', 'value': 23},
    {'word': 'Lucid', 'value': 22},
    {'word': 'Naver', 'value': 20},
    {'word': 'Kakao', 'value': 18},
    {'word': 'NC Soft', 'value': 18},
    {'word': 'LG', 'value': 16},
    {'word': 'Hyundai', 'value': 16},
    {'word': 'KIA', 'value': 16},
    {'word': 'twitter', 'value': 16},
    {'word': 'Tencent', 'value': 15},
    {'word': 'Alibaba', 'value': 15},
    {'word': 'LG', 'value': 16},
    {'word': 'Hyundai', 'value': 16},
    {'word': 'KIA', 'value': 16},
    {'word': 'twitter', 'value': 16},
    {'word': 'Tencent', 'value': 15},
    {'word': 'Alibaba', 'value': 15},
    {'word': 'Disney', 'value': 14},
    {'word': 'Spotify', 'value': 14},
    {'word': 'Udemy', 'value': 13},
    {'word': 'Quizlet', 'value': 13},
    {'word': 'Visa', 'value': 12},
    {'word': 'Lucid', 'value': 22},
    {'word': 'Naver', 'value': 20},
    {'word': 'Hyundai', 'value': 16},
    {'word': 'KIA', 'value': 16},
    {'word': 'twitter', 'value': 16},
    {'word': 'Tencent', 'value': 15},
    {'word': 'Alibaba', 'value': 15},
    {'word': 'Disney', 'value': 14},
    {'word': 'Spotify', 'value': 14},
    {'word': 'Visa', 'value': 12},
    {'word': 'Microsoft', 'value': 10},
    {'word': 'TSMC', 'value': 10},
    {'word': 'PayPal', 'value': 24},
    {'word': 'AT&T', 'value': 10},
    {'word': 'Oracle', 'value': 10},
    {'word': 'Unity', 'value': 10},
    {'word': 'Roblox', 'value': 10},
    {'word': 'Lucid', 'value': 10},
    {'word': 'Naver', 'value': 10},
    {'word': 'Kakao', 'value': 18},
    {'word': 'NC Soft', 'value': 18},
    {'word': 'LG', 'value': 16},
    {'word': 'Hyundai', 'value': 16},
    {'word': 'KIA', 'value': 16},
    {'word': 'twitter', 'value': 16},
    {'word': 'Tencent', 'value': 10},
    {'word': 'Alibaba', 'value': 10},
    {'word': 'Disney', 'value': 14},
    {'word': 'Spotify', 'value': 14},
    {'word': 'Udemy', 'value': 13},
    {'word': 'NC Soft', 'value': 12},
    {'word': 'LG', 'value': 16},
    {'word': 'Hyundai', 'value': 10},
    {'word': 'KIA', 'value': 16},
  ];

  Future<Map<String, double>> sendUrl() async {
    const String url = "http://127.0.0.1:5000/api/data/comments";
    try {
      final response = await http.post(
        Uri.parse(url),
        body: {"url": widget.url},
      );

      List<dynamic> jsonData = jsonDecode(response.body);
      double negative = 0, positive = 0, neutral = 0;
      double rating = 0;

      // print(jsonData);

      int it = 1;
      for (var item in jsonData) {
        List<dynamic> row = [];
        String sentiment;
        if (item['SentimentRating'] < 0) {
          sentiment = 'negative';
          negative++;
        } else if (item['SentimentRating'] > 0) {
          sentiment = 'positive';
          positive++;
        } else {
          sentiment = 'neutral';
          neutral++;
        }
        row.add(it.toString());
        row.add(item['Comments']);
        row.add(sentiment);
        row.add(item['SentimentRating']);
        rating += item['SentimentRating'];
        analyzedDataComments.add(row);
        it++;
      }

      pieChartData = {
        "Positive": positive,
        "Negative": negative,
        "Neutral": neutral,
      };

      overallRating = rating / it + 2;

      setState(() {
        CommentsVisualizer(
          analyzedData: analyzedDataComments,
        );
      });

      // print(pieChartData);
      return pieChartData;
    } catch (exception) {
      return Future.error("Has no comments");
    }
  }

  Future<String> getWordCloud() async {
    const String url = "http://127.0.0.1:5000/api/data/word_cloud";
    try {
      final response = await http.post(
        Uri.parse(url),
        body: {"url": widget.url},
      );

      List<dynamic> decodedJson = json.decode(response.body);

      for (var list in decodedJson) {
        List<dynamic> innerList = List<dynamic>.from(list);
        phraseList.add(innerList);
      }

      wordList = [];

      for (List<dynamic> item in decodedJson) {
        Map mapItem = {'word': item[0], 'value': item[1]};
        wordList.add(mapItem);
      }

      // print(wordList);
      return "200";
    } catch (exception) {
      // print(404);
      // print('Errors $exception');
      return Future.error("Has no comments");
    }
  }

  @override
  void initState() {
    /*sendUrl();
    getWordCloud();*/

    /*_isLoading = true;
    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        _isLoading = false;
      });
    });*/

    super.initState();
    _futureComments = sendUrl();
    _futureWordCloud = getWordCloud();
  }

  @override
  Widget build(BuildContext context) {
    wordCloudData = WordCloudData(data: wordList);

    return FutureBuilder<String>(
      future: _futureWordCloud,
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            backgroundColor: const Color(0xffEBDFD7),
            body: Row(
              children: [
                SafeArea(
                  child: NavigationRail(
                    extended: _navigationIsOpen,
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
                    selectedIndex: _selectedIndexNavBar,
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
                      padding: const EdgeInsets.only(top: 10.0),
                      child: NavigationButton(
                        onTap: () {
                          setState(() {
                            _navigationIsOpen =
                                _navigationIsOpen ? false : true;
                          });
                        },
                        isRight: _navigationIsOpen,
                      ),
                    ),
                    onDestinationSelected: (value) {
                      setState(() {
                        _selectedIndexNavBar = value;
                      });
                      if (_selectedIndexNavBar == 0) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const UrlScreen()));
                      } else if (_selectedIndexNavBar == 1) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => VisualizationScreen(
                                  url: widget.url,
                                )));
                      }
                    },
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      color: const Color(0xffEBDFD7),
                      child:
                          const ErrorMessage(header: "Video has no comments"),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else if (snapshot.hasData) {
          return FutureBuilder<Map<String, double>>(
            future: _futureComments,
            builder: (context, AsyncSnapshot<Map<String, double>> snapshot) {
              if (snapshot.hasData) {
                return Scaffold(
                  backgroundColor: const Color(0xffEBDFD7),
                  body: Row(
                    children: [
                      SafeArea(
                        child: NavigationRail(
                          extended: _navigationIsOpen,
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
                          selectedIndex: _selectedIndexNavBar,
                          selectedLabelTextStyle:
                              const TextStyle(color: Colors.white),
                          selectedIconTheme:
                              const IconThemeData(color: Colors.black),
                          unselectedLabelTextStyle:
                              TextStyle(color: Colors.grey.shade400),
                          unselectedIconTheme:
                              const IconThemeData(color: Colors.white),
                          useIndicator: true,
                          indicatorColor: const Color(0xffEBDFD7),
                          groupAlignment: -0.5,
                          leading: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: NavigationButton(
                              onTap: () {
                                setState(() {
                                  _navigationIsOpen =
                                      _navigationIsOpen ? false : true;
                                });
                              },
                              isRight: _navigationIsOpen,
                            ),
                          ),
                          onDestinationSelected: (value) {
                            setState(() {
                              _selectedIndexNavBar = value;
                            });
                            if (_selectedIndexNavBar == 0) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const UrlScreen()));
                            } else if (_selectedIndexNavBar == 1) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => VisualizationScreen(
                                        url: widget.url,
                                      )));
                            }
                          },
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: SingleChildScrollView(
                            child: Container(
                              color: const Color(0xffEBDFD7),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    const SizedBox(height: 100),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.05,
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Container(
                                                  width: 700,
                                                  height: 600,
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xff101F36),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                      border: Border.all(
                                                          color: const Color(
                                                              0xff101F36))),
                                                  child: SingleChildScrollView(
                                                      child: CommentsVisualizer(
                                                    analyzedData:
                                                        analyzedDataComments,
                                                  ))),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 30,
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: [
                                              CommentsNumber(
                                                header: 'Total comments',
                                                numberOfComments:
                                                    analyzedDataComments.length,
                                              ),

                                              const SizedBox(height: 20),

                                              // NavBar()

                                              SentimentRating(
                                                rating: overallRating,
                                                header: 'Overall rating',
                                              ),

                                              const SizedBox(height: 20),

                                              SentimentPieChart(
                                                pieChartData: pieChartData,
                                                header: 'Overall sentiment',
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.01,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 50),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.05,
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: [
                                              PhrasesNumber(
                                                header: 'Total phrases',
                                                numberOfPhrases:
                                                    phraseList.length,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.4,
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              WordCloud(
                                                wcData: wordCloudData,
                                                header: 'Word cloud',
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.4,
                                                height: 450,
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 30,
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Container(
                                                  width: 500,
                                                  height: 600,
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xff101F36),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                      border: Border.all(
                                                          color: const Color(
                                                              0xff101F36))),
                                                  child: SingleChildScrollView(
                                                      child: PhrasesVisualizer(
                                                    wordListData: phraseList,
                                                  ))),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.05,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 50),
                                  ]),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Container(
                  decoration: const BoxDecoration(color: Color(0xffEBDFD7)),
                  child: const Center(child: CircularProgressIndicator()),
                );
              }
            },
          );
        } else {
          return Container(
            decoration: const BoxDecoration(color: Color(0xffEBDFD7)),
            child: const Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
