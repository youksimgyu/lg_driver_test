import 'package:flutter/material.dart';
import 'package:lg_driver_test/widgets/home_screen.dart';

void main() {
  runApp(const LGDriverTest());
}

class LGDriverTest extends StatelessWidget {
  const LGDriverTest({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LG Driver Test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(
        title: 'LG Driver Test',
      ),
    );
  }
}
