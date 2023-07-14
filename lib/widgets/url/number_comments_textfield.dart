import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vibe_checker/widgets/url/numerical_range_formatter.dart';

class NumberOfCommentsTextfield extends StatelessWidget {
  final TextEditingController controller;
  final int numberOfComments;

  const NumberOfCommentsTextfield({
    super.key,
    required this.controller,
    required this.numberOfComments,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(3),
          NumericalRangeFormatter(min: 1, max: 100),
        ],
        decoration: const InputDecoration(
          hintText: 'From 1 to 100',
          hintStyle: TextStyle(color: Colors.black),
          focusColor: Colors.black,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xff220F58)),
          ),
        ),
      ),
    );
  }
}
