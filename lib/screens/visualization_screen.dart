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
  Map<String, double> pieChartData = {};

  late WordCloudData wordCloudData;

  List<Map> wordList = [];

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
          analyzedData: analyzedDataComments,
          dark: dark,
        );
      });

      setState(() {
        wordCloudData = WordCloudData(data: wordList);
      });

      print(wordCloudData);
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

      print(wordList);
      return "200";
    } catch (exception) {
      print(wordList);
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
                        child: ErrorMessage(
                          header: "Server is not running",
                          dark: dark,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (snapshot.hasData) {
          wordCloudData = WordCloudData(data: wordList);
          bool invalidUrl = widget.url == '';
          bool zeroComments = analyzedDataComments.isEmpty;
          bool invalidProcess = (wordList.isEmpty || zeroComments);
          print(wordList);
          print(wordList.isEmpty);
          print(invalidUrl);
          print(zeroComments);
          print(invalidProcess);
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
                        (invalidUrl || zeroComments || invalidProcess)
                            ? Expanded(
                                child: Center(
                                  child: Container(
                                    color: const Color(0xffEBDFD7),
                                    child: ErrorMessage(
                                      header: invalidUrl
                                          ? "Invalid url"
                                          : "Comments are not available",
                                      dark: dark,
                                    ),
                                  ),
                                ),
                              )
                            : Expanded(
                                child: Center(
                                  child: SingleChildScrollView(
                                    child: Container(
                                      color: const Color(0xffEBDFD7),
                                      padding: EdgeInsets.symmetric(
                                        horizontal:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                      ),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            NavigationPanel(onTap: () {}),
                                            const SizedBox(height: 20),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                UrlCopy(
                                                    dark: dark,
                                                    url: widget.url),
                                                ProjectName(
                                                    header: "Project 1",
                                                    dark: dark),
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
                                                                      .circular(
                                                                          16),
                                                              border: Border.all(
                                                                  color:
                                                                      borderColor)),
                                                          child:
                                                              SingleChildScrollView(
                                                                  child:
                                                                      CommentsVisualizer(
                                                            analyzedData:
                                                                analyzedDataComments,
                                                            dark: dark,
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
                                                        header:
                                                            'Total comments',
                                                        numberOfComments:
                                                            analyzedDataComments
                                                                .length,
                                                        dark: dark,
                                                      ),
                                                      const SizedBox(
                                                          height: 20),
                                                      SentimentRating(
                                                        rating: overallRating,
                                                        header:
                                                            'Overall rating',
                                                        dark: dark,
                                                      ),
                                                      const SizedBox(
                                                          height: 20),
                                                      SentimentPieChart(
                                                        pieChartData:
                                                            pieChartData,
                                                        header:
                                                            'Overall sentiment',
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
                                                        width: MediaQuery.of(
                                                                    context)
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
                                                        width: MediaQuery.of(
                                                                    context)
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
                                                                      .circular(
                                                                          16),
                                                              border: Border.all(
                                                                  color:
                                                                      borderColor)),
                                                          child:
                                                              SingleChildScrollView(
                                                                  child:
                                                                      PhrasesVisualizer(
                                                            dark: dark,
                                                            wordListData:
                                                                phraseList,
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
