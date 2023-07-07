import 'package:vibe_checker/screens/url_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Url screen should lead to visualization page', (tester) async {
    const url = 'https://www.youtube.com/watch?v=peloHl5sb4I';
    await tester.pumpWidget(UrlScreen());

    await tester.enterText(find.byType(TextField), url);

    await tester.tap(find.byType(FloatingActionButton));
  });
}