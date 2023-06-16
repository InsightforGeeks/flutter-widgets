import 'package:bottom_navigation_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Bottom navigation app test', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the home page is displayed initially.
    expect(find.text('Home Page'), findsOneWidget);
    expect(find.text('Messages Page'), findsNothing);
    expect(find.text('Profile Page'), findsNothing);

    // Tap on the Messages tab.
    await tester.tap(find.byIcon(Icons.message));
    await tester.pump();

    // Verify that the Messages page is displayed.
    expect(find.text('Home Page'), findsNothing);
    expect(find.text('Messages Page'), findsOneWidget);
    expect(find.text('Profile Page'), findsNothing);

    // Tap on the Profile tab.
    await tester.tap(find.byIcon(Icons.person));
    await tester.pump();

    // Verify that the Profile page is displayed.
    expect(find.text('Home Page'), findsNothing);
    expect(find.text('Messages Page'), findsNothing);
    expect(find.text('Profile Page'), findsOneWidget);
  });
}
