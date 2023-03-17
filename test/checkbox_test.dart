import 'package:coba_flutter/custom_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Testing Checkbox Widget", () {
    group("Testing Checkbox with 2 state", () {
      testWidgets(
        "Testing checkbox when the value is true must show the checked icon",
        (WidgetTester tester) async {
          bool isChecked = true;
          await tester.pumpWidget(
            MaterialApp(
              home: GarethCheckbox(
                key: const Key("Checkbox"),
                size: const Size(50, 50),
                value: isChecked,
                borderColor: Colors.grey,
                boxColor: Colors.blue,
                cornerRadius: 3,
                iconSize: 30,
                iconColor: Colors.white,
                tristate: false,
                onChange: (bool? value) {
                  if (value != null) {
                    isChecked = value;
                  }
                },
              ),
            ),
          );

          final finder = find.byIcon(Icons.check);

          expect(finder, findsOneWidget);
        },
      );

      testWidgets(
        "Testing checkbox when the value is false must hide the checked icon",
        (WidgetTester tester) async {
          bool isChecked = true;
          await tester.pumpWidget(
            MaterialApp(
              home: GarethCheckbox(
                key: const Key("Checkbox"),
                size: const Size(50, 50),
                value: isChecked,
                borderColor: Colors.grey,
                boxColor: Colors.blue,
                cornerRadius: 3,
                iconSize: 30,
                iconColor: Colors.white,
                tristate: false,
                onChange: (bool? value) {
                  if (value != null) {
                    isChecked = value;
                  }
                },
              ),
            ),
          );

          final finder = find.byIcon(Icons.check);

          expect(finder, findsOneWidget);
        },
      );
    });

    group("Testing Checkbox with 3 state", () {
      testWidgets(
        "Testing checkbox when the value is true must show the checked icon",
        (WidgetTester tester) async {
          bool isChecked = true;
          await tester.pumpWidget(
            MaterialApp(
              home: GarethCheckbox(
                key: const Key("Checkbox"),
                size: const Size(50, 50),
                value: isChecked,
                borderColor: Colors.grey,
                boxColor: Colors.blue,
                cornerRadius: 3,
                iconSize: 30,
                iconColor: Colors.white,
                tristate: true,
                onChange: (bool? value) {
                  if (value != null) {
                    isChecked = value;
                  }
                },
              ),
            ),
          );

          final finder = find.byIcon(Icons.check);

          expect(finder, findsOneWidget);
        },
      );

      testWidgets(
        "Testing checkbox when the value is false must hide the checked icon",
        (WidgetTester tester) async {
          bool isChecked = false;
          await tester.pumpWidget(
            MaterialApp(
              home: GarethCheckbox(
                key: const Key("Checkbox"),
                size: const Size(50, 50),
                value: isChecked,
                borderColor: Colors.grey,
                boxColor: Colors.blue,
                cornerRadius: 3,
                iconSize: 30,
                iconColor: Colors.white,
                tristate: true,
                onChange: (bool? value) {
                  if (value != null) {
                    isChecked = value;
                  }
                },
              ),
            ),
          );

          final finder = find.byIcon(Icons.check);

          expect(finder, findsNothing);
        },
      );

      testWidgets(
        "Testing checkbox when the value is null must show the nullstate icon",
        (WidgetTester tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: GarethCheckbox(
                key: const Key("Checkbox"),
                size: const Size(50, 50),
                value: null,
                borderColor: Colors.grey,
                boxColor: Colors.blue,
                cornerRadius: 3,
                iconSize: 30,
                iconColor: Colors.white,
                tristate: true,
                onChange: (bool? value) {},
              ),
            ),
          );

          final finder = find.byIcon(Icons.remove);

          expect(finder, findsOneWidget);
        },
      );
    });
  });
}
