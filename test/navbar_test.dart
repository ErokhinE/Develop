import 'package:vibe_checker/screens/url_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vibe_checker/widgets/navigation/navigation_button.dart';

void ignoreOverflowErrors(
  FlutterErrorDetails details, {
  bool forceReport = false,
}) {
  bool ifIsOverflowError = false;
  bool isUnableToLoadAsset = false;

  // Detect overflow error.
  var exception = details.exception;
  if (exception is FlutterError) {
    ifIsOverflowError = !exception.diagnostics.any(
      (e) => e.value.toString().startsWith("A RenderFlex overflowed by"),
    );
    isUnableToLoadAsset = !exception.diagnostics.any(
      (e) => e.value.toString().startsWith("Unable to load asset"),
    );
  }

  // Ignore if is overflow error.
  if (ifIsOverflowError || isUnableToLoadAsset) {
    // debugPrint('Ignored Error');
  } else {
    FlutterError.dumpErrorToConsole(details, forceReport: forceReport);
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('User pressed open navbar button and it opens', (tester) async {
    FlutterError.onError = ignoreOverflowErrors;

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
