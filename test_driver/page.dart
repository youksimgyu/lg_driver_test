import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

// 페이지 이동 테스트
class Page {
  static void pageTest() {
    late FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      driver.close();
    });

    setUp(() async {
      await driver.requestData('restart');
    });

    test('page Test', () async {
      // 첫 번째 페이지 테스트
      final secondPage = find.text('Go to Second Screen');
      expect(await driver.getText(secondPage), 'Go to Second Screen');

      // 두 번째 페이지로 이동
      await driver.tap(secondPage);

      // 두 번째 페이지로 이동 후 테스트
      final secondPageTitle = find.text('Second Screen');
      expect(await driver.getText(secondPageTitle), 'Second Screen');

      // 스크롤 맨 아래로 테스트
      await driver.scrollUntilVisible(
        find.byType('ListView'),
        find.text('Item 19'),
        dyScroll: -300,
      );

      // 스크롤 맨 위로 테스트
      await driver.scrollUntilVisible(
        find.byType('ListView'),
        find.text('Item 0'),
        dyScroll: 300,
      );

      // 스크롤 맨 아래로 테스트
      await driver.scrollUntilVisible(
        find.byType('ListView'),
        find.text('Item 19'),
        dyScroll: -300,
      );

      final item19 = find.byValueKey('item_1');
      expect(await driver.getText(item19), 'Item 1');

      await driver.tap(item19);

      final lgDriverTest = find.text('LG Driver Test');
      expect(await driver.getText(lgDriverTest), 'LG Driver Test');
      final counter = find.byValueKey('counter');
      expect(await driver.getText(counter), '11');
    });
  }
}
