import 'package:vibe_checker/screens/url_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vibe_checker/widgets/navigation_button.dart';

void main() {
  testWidgets('User pressed open navbar button and it opens', (tester) async {
    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr, // Set the appropriate text direction
        child: MaterialApp(
          home: UrlScreen(), // Replace MyApp() with your app's widget
        ),
      ),
    );

    await tester.tap(find.byType(NavigationButton));

    await tester.pump();

    expect(find.text("Analyze"), findsWidgets);
  });
}