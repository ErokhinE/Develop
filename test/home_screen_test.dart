import 'package:vibe_checker/screens/url_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vibe_checker/widgets/analyze_button.dart';

void main() {
  testWidgets('Url screen should lead to visualization page', (tester) async {
    const url = 'https://www.youtube.com/watch?v=peloHl5sb4I';
    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr, // Set the appropriate text direction
        child: MaterialApp(
          home: UrlScreen(), // Replace MyApp() with your app's widget
        ),
      ),
    );
    // await tester.pumpWidget(const UrlScreen());

    await tester.enterText(find.byType(TextField), url);

    await tester.tap(find.byType(AnalyzeButton));

    await tester.pump();

    expect(find.text("Analyze"), findsWidgets);
  });
}