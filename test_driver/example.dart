import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_test/flutter_test.dart' as test;

class Example {
  static void exampleTest() {
    FlutterDriver? driver;

    test.setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    test.tearDownAll(() {
      if (driver != null) driver?.close();
    });

    test.test('Increment Counter', () async {
      // countertenor 키를 가진 텍스트 위젯을 찾습니다.
      final counterTextFinder = find.byValueKey('counter');

      // 초기 카운터 값이 0인지 확인합니다.
      test.expect(await driver?.getText(counterTextFinder), "0");

      // increment 키를 가진 버튼 위젯을 찾습니다.
      final buttonFinder = find.byValueKey('increment');

      // 버튼을 탭합니다.
      await driver?.tap(buttonFinder);

      // 카운터 값이 1로 증가했는지 확인합니다.
      test.expect(await driver?.getText(counterTextFinder), "1");
    });
  }
}
