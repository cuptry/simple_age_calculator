import 'package:flutter/material.dart';
import 'components/age_calculator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '만 나이 계산기',
      home: AgeCalculator(),
    );
  }
}
