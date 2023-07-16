import 'dart:convert';

import 'package:demo12/screens/url_screen.dart';
import 'package:flutter/material.dart';

import 'package:demo12/widgets/comments_visualizer.dart';
import 'package:demo12/widgets/navigation_button.dart';
import 'package:demo12/widgets/number_comments.dart';
import 'package:demo12/widgets/number_phrases.dart';
import 'package:demo12/widgets/phrases_visualizer.dart';
import 'package:demo12/widgets/sentiment_pie_chart.dart';
import 'package:demo12/widgets/sentiment_rating.dart';
import 'package:demo12/widgets/word_cloud.dart';
import 'package:word_cloud/word_cloud_data.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:http/http.dart' as http;

class VisualizationScreen extends StatefulWidget {
  final String url;
  const VisualizationScreen({super.key, required this.url});

  @override
  State<VisualizationScreen> createState() => _VisualizationScreenState();
}

class _VisualizationScreenState extends State<VisualizationScreen> {
  // data for comments
  late bool _isLoading;
  var _selectedIndexNavBar = 1;
  var _navigationIsOpen = false;
  List<List<dynamic>> analyzedDataComments = [];
  Map<String, double> pieChartData = {};
  final double overallRating = 2.75;

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

  Future<void> sendUrl() async {
    const String url = "http://127.0.0.1:5000/api/data";
    try {
      final response = await http.post(
        Uri.parse(url),
        body: {"url": widget.url},
      );

      List<dynamic> jsonData = jsonDecode(response.body);
      double negative = 0, positive = 0, neutral = 0;

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
        analyzedDataComments.add(row);
        it++;
      }

      pieChartData = {
        "Positive": positive,
        "Negative": negative,
        "Neutral": neutral,
      };

      setState(() {
        CommentsVisualizer(analyzedData: analyzedDataComments,);
      });
    } catch (exception) {
      // print('Errors $exception');
    }
  }

  @override
  void initState() {
    sendUrl();

    _isLoading = true;
    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        _isLoading = false;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    wordCloudData = WordCloudData(data: wordList);

    return Scaffold(
      backgroundColor: const Color(0xffEBDFD7),
      body: _isLoading
          ? Center(
          child: CircularPercentIndicator(
            animation: true,
            animationDuration: 1000,
            radius: 200,
            lineWidth: 40,
            percent: 1,
            progressColor: const Color(0xff101F36),
            backgroundColor: Colors.black26,
            circularStrokeCap: CircularStrokeCap.round,
          ))
          : Row(
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
              selectedLabelTextStyle: const TextStyle(color: Colors.white),
              selectedIconTheme: const IconThemeData(color: Colors.black),
              unselectedLabelTextStyle: TextStyle(color: Colors.grey.shade400),
              unselectedIconTheme: const IconThemeData(color: Colors.white),
              useIndicator: true,
              indicatorColor: const Color(0xffEBDFD7),
              groupAlignment: -0.5,
              leading: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: NavigationButton(
                  onTap: () {
                    setState(() {
                      _navigationIsOpen = _navigationIsOpen ? false : true;
                    });
                  }, isRight: _navigationIsOpen,
                ),
              ),
              onDestinationSelected: (value) {
                setState(() {
                  _selectedIndexNavBar = value;
                });
                if (_selectedIndexNavBar == 0) {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const UrlScreen()));
                } else if (_selectedIndexNavBar == 1) {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => VisualizationScreen(url: widget.url,)));
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
                            const SizedBox(
                              width: 70,
                            ),
                            Column(
                              children: [
                                Container(
                                    width: 700,
                                    height: 600,
                                    decoration: BoxDecoration(
                                        color: const Color(0xff101F36),
                                        borderRadius: BorderRadius.circular(16),
                                        border: Border.all(color: const Color(0xff101F36))),
                                    child: SingleChildScrollView(
                                        child: CommentsVisualizer(analyzedData: analyzedDataComments,))),
                              ],
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              child: Column(
                                children: [

                                  CommentsNumber(
                                    header: 'Total comments',
                                    numberOfComments: analyzedDataComments.length,
                                  ),

                                  const SizedBox(height: 20),

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
                          ],
                        ),

                        const SizedBox(height: 50),

                        Row(
                          children: [

                            const SizedBox(
                              width: 70,
                            ),

                            Expanded(
                              child: Column(
                                children: [

                                  const PhrasesNumber(header: 'Total phrases', numberOfPhrases: 20,),

                                  const SizedBox(
                                    height: 20,
                                  ),

                                  WordCloud(
                                    wcData: wordCloudData,
                                    header: 'Word cloud',
                                    width: 600,
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
                                          color: const Color(0xff101F36),
                                          borderRadius: BorderRadius.circular(16),
                                          border: Border.all(color: const Color(0xff101F36))),
                                      child: const SingleChildScrollView(
                                          child: PhrasesVisualizer())),
                                ],
                              ),
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
  }
}
