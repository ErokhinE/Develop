import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vibe_checker/widgets/navigation/navbar.dart';
import 'package:vibe_checker/widgets/navigation/side_navbar.dart';
import 'package:vibe_checker/widgets/visualization/comments_visualizer.dart';
import 'package:vibe_checker/widgets/error.dart';
import 'package:vibe_checker/widgets/visualization/number_comments.dart';
import 'package:vibe_checker/widgets/visualization/number_phrases.dart';
import 'package:vibe_checker/widgets/visualization/phrases_visualizer.dart';
import 'package:vibe_checker/widgets/visualization/project_name.dart';
import 'package:vibe_checker/widgets/visualization/sentiment_pie_chart.dart';
import 'package:vibe_checker/widgets/visualization/sentiment_rating.dart';
import 'package:vibe_checker/widgets/visualization/url.dart';
import 'package:vibe_checker/widgets/visualization/word_cloud.dart';
import 'package:word_cloud/word_cloud_data.dart';
import 'package:http/http.dart' as http;

class VisualizationScreen extends StatefulWidget {
  final String url;
  final int numberOfComments;

  const VisualizationScreen(
      {super.key, required this.url, required this.numberOfComments});

  @override
  State<VisualizationScreen> createState() => _VisualizationScreenState();
}

class _VisualizationScreenState extends State<VisualizationScreen> {
  // data for comments
  List<List<dynamic>> analyzedDataComments = [];
  bool dark = true;
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
        body: {
          "url": widget.url,
          "comments_number": widget.numberOfComments.toString()
        },
      );

      List<dynamic> jsonData = jsonDecode(response.body);
      double negative = 0, positive = 0, neutral = 0;
      double rating = 0;

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
          analyzedData: analyzedDataComments, dark: dark,
        );
      });

      setState(() {
        wordCloudData = WordCloudData(data: wordList);
      });

      print(wordList);
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
        body: {
          "url": widget.url,
          "comments_number": widget.numberOfComments.toString()
        },
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

      return "200";
    } catch (exception) {
      return Future.error("Has no comments");
    }
  }

  @override
  void initState() {
    super.initState();
    _futureComments = sendUrl();
    _futureWordCloud = getWordCloud();
  }

  @override
  Widget build(BuildContext context) {
    final Color bgColor =
        dark ? const Color(0xff101F36) : Colors.white.withOpacity(0.7);
    final Color borderColor =
        dark ? const Color(0xff101F36) : const Color(0xffEBDFD7);
    print(wordList);
    wordCloudData = WordCloudData(data: wordList);

    return FutureBuilder<String>(
      future: _futureWordCloud,
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            backgroundColor: const Color(0xffEBDFD7),
            body: SafeArea(
              child: Row(
                children: [
                  SideNavBar(
                    index: 1,
                    url: widget.url,
                    numberOfComments: widget.numberOfComments,
                  ),
                  Expanded(
                    child: Center(
                      child: Container(
                        color: const Color(0xffEBDFD7),
                        child:
                            ErrorMessage(header: "Video has no comments", dark: dark,),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (snapshot.hasData) {
          wordCloudData = WordCloudData(data: wordList);
          return FutureBuilder<Map<String, double>>(
            future: _futureComments,
            builder: (context, AsyncSnapshot<Map<String, double>> snapshot) {
              if (snapshot.hasData) {
                return Scaffold(
                  backgroundColor: const Color(0xffEBDFD7),
                  body: SafeArea(
                    child: Row(
                      children: [
                        SideNavBar(
                          url: widget.url,
                          index: 1,
                          numberOfComments: widget.numberOfComments,
                        ),
                        Expanded(
                          child: Center(
                            child: SingleChildScrollView(
                              child: Container(
                                color: const Color(0xffEBDFD7),
                                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context)
                                    .size
                                    .width *
                                    0.05,),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      NavigationPanel(onTap: () {}),

                                      const SizedBox(height: 20),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          UrlCopy(dark: dark, url: widget.url),
                                          ProjectName(header: "Project 1", dark: dark),
                                        ],
                                      ),

                                      const SizedBox(height: 30),

                                      Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              children: [
                                                Container(
                                                    width: 700,
                                                    height: 600,
                                                    decoration: BoxDecoration(
                                                        color: bgColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                        border: Border.all(
                                                            color: borderColor)
                                                    ),
                                                    child: SingleChildScrollView(
                                                        child: CommentsVisualizer(
                                                      analyzedData:
                                                          analyzedDataComments, dark: dark,
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
                                                      analyzedDataComments
                                                          .length,
                                                  dark: dark,
                                                ),

                                                const SizedBox(height: 20),

                                                SentimentRating(
                                                  rating: overallRating,
                                                  header: 'Overall rating',
                                                  dark: dark,
                                                ),

                                                const SizedBox(height: 20),

                                                SentimentPieChart(
                                                  pieChartData: pieChartData,
                                                  header: 'Overall sentiment',
                                                  dark: dark,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 50),
                                      Row(
                                        children: [
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
                                                  dark: dark,
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
                                                  dark: dark,
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
                                                        color: bgColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                        border: Border.all(
                                                            color: borderColor)),
                                                    child: SingleChildScrollView(
                                                        child: PhrasesVisualizer(
                                                      dark: dark,
                                                      wordListData: phraseList,
                                                    ))),
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
