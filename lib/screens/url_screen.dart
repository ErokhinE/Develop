import 'package:flutter/material.dart';
import 'package:demo12/screens/visualization_screen.dart';
import 'package:demo12/widgets/analyze_button.dart';
import 'package:demo12/widgets/logo.dart';
import 'package:demo12/widgets/multiple_url_divider.dart';
import 'package:demo12/widgets/my_textfield.dart';


class UrlScreen extends StatefulWidget {
  const UrlScreen({super.key});

  @override
  State<UrlScreen> createState() => _UrlScreenState();
}

class _UrlScreenState extends State<UrlScreen> {
  final usernameController = TextEditingController();

  void analyze() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          width: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // logo
              Logo(),

              MyTextField(
                controller: usernameController,
                hintText: 'Youtube URL',
                obscure: false,
              ),

              MultipleUrlDivider(),

              const SizedBox(
                height: 20,
              ),

              AnalyzeButton(onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const VisualizationPage()));
              }),
            ],
          ),
        ),
      ),
    );
  }
}
