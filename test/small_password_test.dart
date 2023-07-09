import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vibe_checker/screens/login_screen.dart';

void main() {
  testWidgets('User enter password with less than 6 symbols in login page',
      (tester) async {
    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr, // Set the appropriate text direction
        child: MaterialApp(
          home: LoginScreen(), // Replace MyApp() with your app's widget
        ),
      ),
    );
    // await tester.pumpWidget(const UrlScreen());

    await tester.enterText(find.byKey(const Key('emailField')), "naro");

    await tester.enterText(find.byKey(const Key('passwordField')), "halod");

    await tester.tap(find.byType(ElevatedButton));

    await tester.pump();

    expect(find.text("Минимум 6 символов"), findsWidgets);
  });
}
