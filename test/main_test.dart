import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'package:lg_driver_test/common_test_keys/test_keys.dart';

void main() {
  group('MyApp Test', () {
    late FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    setUp(() async {
      if (driver != null) {
        await driver.requestData('restart');  // Add this line
      }
    });

    test('navigate to second page, scroll to tested item', () async {
      var buttonFinder = find.byValueKey(Keys.goToSecondPage);  // Use the key to find the button
      await driver.tap(buttonFinder);

      var scrollFinder = find.byValueKey(Keys.scrollList);
      var lastItemFinder = find.text(Keys.item33);  // Find the text of the last item

      await driver.scrollUntilVisible(
          scrollFinder,
          lastItemFinder,
          dyScroll: -300.0  // Scroll up by 300 logical pixels each time
      );

      // Verify that the last item is now visible
      expect(await driver.getText(lastItemFinder), Keys.item33);
    });


    test('navigate to second page, scroll to tested item', () async {
      var buttonFinder = find.byValueKey(Keys.goToSecondPage);  // Use the key to find the button
      await driver.tap(buttonFinder);

      var scrollFinder = find.byValueKey(Keys.scrollList);
      var lastItemFinder = find.text(Keys.item10);  // Find the text of the last item

      await driver.scrollUntilVisible(
          scrollFinder,
          lastItemFinder,
          dyScroll: -300.0  // Scroll up by 300 logical pixels each time
      );

      // Verify that the last item is now visible
      expect(await driver.getText(lastItemFinder), Keys.item10);
    });


  });
}
