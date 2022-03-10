import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:integration_test/integration_test.dart';
import 'package:flutter_firebase_test/main.dart' as app;

void main() {
  group('App Test', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    testWidgets("full app test", (tester) async {
      app.main();
      await tester.pumpAndSettle();

      final emailFormField = find.byType(TextFormField).first;
      final passwordFormField = find.byType(TextFormField).last;
      final loginButton = find.byType(ElevatedButton).first;

      await tester.enterText(emailFormField, 'pthangella@test.com');
      await tester.enterText(passwordFormField, '123456789');
      await tester.pumpAndSettle();

      await tester.tap(loginButton);
      await tester.pumpAndSettle();

      // final firstcheckbox = find.byType(Checkbox).first;

      // findig the widget
      var textFind = find.textContaining("Amazing");
      // checking widget present or not
      expect(textFind, findsOneWidget);

      var textFind2 = find.textContaining("Happiness");
      expect(textFind2, findsOneWidget);
      /*
      final firstcheckbox = find.byType(CheckboxListTile).first;
      expect(
          tester.getSemantics(firstcheckbox),
          matchesSemantics(
            //hasTapAction: true,
            //hasCheckedState: true,
            isChecked: false,
            //hasEnabledState: true,
            //isEnabled: true,
            //isFocusable: false
            //
          ));
      tester.tap(firstcheckbox);
      await tester.pumpAndSettle();

      expect(
          tester.getSemantics(firstcheckbox),
          matchesSemantics(
            //hasTapAction: true,
            // hasCheckedState: true,
            isChecked: true,
            // hasEnabledState: true,
            // isEnabled: true,
            // isFocusable: false
          ));
          */
    });
  });
}
