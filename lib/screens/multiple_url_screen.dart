import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:demo12/data/database.dart';
import 'package:demo12/screens/url_screen.dart';
import 'package:demo12/screens/visualization_screen.dart';
import 'package:demo12/widgets/add_button.dart';
import 'package:demo12/widgets/analyze_button.dart';
import 'package:demo12/widgets/list_element.dart';
import 'package:demo12/widgets/logo.dart';
import 'package:demo12/widgets/my_textfield.dart';

class MultipleUrlScreen extends StatefulWidget {
  const MultipleUrlScreen({super.key});

  @override
  State<MultipleUrlScreen> createState() => _MultipleUrlScreenState();
}

class _MultipleUrlScreenState extends State<MultipleUrlScreen> {
  // reference the hive box
  final _myBox = Hive.box('mybox');
  UrlDataBase dataBase = UrlDataBase();

  @override
  void initState() {
    // if this is the first time ever opening the app, then create default data
    if (_myBox.get("URLLIST") == null) {
      dataBase.createInitialData();
    } else {
      // there are already exists data
      dataBase.loadData();
    }
    super.initState();
  }

  // url controller
  final _urlController = TextEditingController();

  // save new url
  void saveNewUrl() {
    setState(() {
      if (_urlController.text != "") {
        dataBase.urlList.insert(0, _urlController.text);
      }
    });
    dataBase.updateData();
  }

  // delete url
  void deleteUrl(int index) {
    setState(() {
      dataBase.urlList.removeAt(index);
    });
    dataBase.updateData();
  }

  void analyze() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: 500,
          child: Column(
            children: [

              SizedBox(height: 20,),

              Logo(),

              MyTextField(
                controller: _urlController,
                hintText: 'Youtube URL',
                obscure: false,
              ),

              AddButton(onTap: saveNewUrl),

              Container(
                height: 320,
                margin: EdgeInsets.all(25),
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 3,
                      color: Colors.black12,
                    ),
                    borderRadius: BorderRadius.circular(8)),
                child: ListView.builder(
                  itemCount: dataBase.urlList.length,
                  itemBuilder: (context, index) {
                    return UrlTile(
                      url: dataBase.urlList[index],
                      deleteFunction: () => deleteUrl(index),
                    );
                  },
                ),
              ),

              AnalyzeButton(onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => VisualizationPage()));
              }),

            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const UrlScreen()));
        },
        child: Icon(Icons.home),
      ),
    );
  }
}
