import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:demo12/screens/url_screen.dart';
import 'package:demo12/widgets/comments_visualizer.dart';
import 'package:demo12/widgets/sentiment_pie_chart.dart';
import 'package:demo12/widgets/sentiment_rating.dart';
import 'package:demo12/widgets/word_cloud.dart';
import 'package:word_cloud/word_cloud_data.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class VisualizationPage extends StatefulWidget {
  const VisualizationPage({super.key});

  @override
  State<VisualizationPage> createState() => _VisualizationPageState();
}

class _VisualizationPageState extends State<VisualizationPage> {
  // data for comments
  List<List<dynamic>>? csvData;
  late bool _isLoading;

  // overall rating
  final double _rating = 2.75;

  late WordCloudData wcdata;

  List<Map> word_list = [
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

  // pie chart data
  Map<String, double> pieChartData = {
    "Positive": 50,
    "Negative": 38,
    "Neutral": 10,
  };

  @override
  void initState() {

    _isLoading = true;
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _isLoading = false;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    wcdata = WordCloudData(data: word_list);

    return Scaffold(
      body: _isLoading
          ? Center(
          child: CircularPercentIndicator(
            animation: true,
            animationDuration: 1000,
            radius: 200,
            lineWidth: 40,
            percent: 1,
            progressColor: Colors.black,
            backgroundColor: Colors.black26,
            circularStrokeCap: CircularStrokeCap.round,
          ))
          : Center(
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                const SizedBox(height: 50),

                Column(
                  children: [
                    const Text(
                      'Comments',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        width: 500,
                        height: 500,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const SingleChildScrollView(
                            child: CommentsVisualizer())),
                  ],
                ),

                const SizedBox(height: 50),

                // word cloud
                WordCloud(wcData: wcdata, header: 'Word cloud',),

                const SizedBox(height: 50),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // negative word cloud
                    WordCloud(wcData: wcdata, header: 'Negative word cloud',),

                    const SizedBox(width: 40),

                    // positive word cloud
                    WordCloud(wcData: wcdata, header: 'Positive word cloud',),
                  ],
                ),

                const SizedBox(height: 50),

                SentimentPieChart(pieChartData: pieChartData, header: 'Overall sentiment'),

                const SizedBox(height: 50),

                // sentiment rating
                SentimentRating(rating: _rating, header: 'Overall rating'),

                const SizedBox(height: 50),
              ]),
        ),
      ),

      floatingActionButton: _isLoading
          ? null
          : FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const UrlScreen()));
        },
        backgroundColor: Colors.black,
        child: const Icon(
          Icons.home,
          color: Colors.white,
        ),
      ),
    );
  }
}
