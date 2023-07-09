import 'package:vibe_checker/screens/url_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('User press on settings button and window with choose number of comments shown', (tester) async {
    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr, // Set the appropriate text direction
        child: MaterialApp(
          home: UrlScreen(), // Replace MyApp() with your app's widget
        ),
      ),
    );

    await tester.tap(find.byType(IconButton));

    await tester.pump();

    expect(find.text("Number of comments"), findsWidgets);
  });
}