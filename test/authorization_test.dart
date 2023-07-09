import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vibe_checker/screens/login_screen.dart';

void main() {
  testWidgets('Unregistered user try to login and got error', (tester) async {
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

    await tester.enterText(find.byKey(const Key('passwordField')), "halodniy");

    await tester.tap(find.byType(ElevatedButton));

    await tester.pump();

    expect(find.text("Введите правильный Email"), findsWidgets);
  });
}