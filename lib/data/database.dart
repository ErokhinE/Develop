import 'package:hive_flutter/hive_flutter.dart';

class UrlDataBase {
  List urlList = [];

  // reference the box
  final _myBox = Hive.box('mybox');

  // run this method if this is the first time ever opening the app
  void createInitialData() {
    urlList = [
      "Put here your URLs",
    ];
  }

  // load the data from database
  void loadData() {
    urlList = _myBox.get("URLLIST");
  }

  // update the data from database
  void updateData() {
    _myBox.put("URLLIST", urlList);
  }
}

class WordCloudDataBase {
  List<Map> wordCloudList = [];
  List<Map> negativeWordCloudList = [];
  List<Map> positiveWordCloudList = [];

  // reference the box
  final _myBox = Hive.box('mybox');

  void createInitialDate() {
    wordCloudList = [
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
    negativeWordCloudList = [

    ];
    positiveWordCloudList = [];
  }

  // load the data from database
  void loadData() {
    wordCloudList = _myBox.get("WORDLIST");
    negativeWordCloudList = _myBox.get("NEGWORDLIST");
    positiveWordCloudList = _myBox.get("POSWORDLIST");
  }

  // update the data from database
  void updateData() {
    _myBox.put("WORDLIST", wordCloudList);
    _myBox.put("NEGWORDLIST", negativeWordCloudList);
    _myBox.put("POSWORDLIST", positiveWordCloudList);
  }
}
