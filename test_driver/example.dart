import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

class Example {
  static void exampleTest() {
    late FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() {
      driver.close();
    });

    setUp(() async {
      await driver.requestData('restart');
    });

    test('Increment Counter', () async {
      final text = find.text('You have pushed the button this many times:');

      expect(
        await driver.getText(text),
        'You have pushed the button this many times:',
      );

      final tooltip = find.byTooltip('increment');

      await driver.tap(tooltip);

      final counter = find.byValueKey('counter');

      expect(await driver.getText(counter), '1');

      for (int i = 0; i < 10; i++) {
        await driver.tap(tooltip);
      }

      expect(await driver.getText(counter), '11');
    });
  }
}
