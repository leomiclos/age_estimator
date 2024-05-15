import 'package:flutter/material.dart';
import 'age_estimator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Estimativa de Idade',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AgeEstimatorApp(),
    );
  }
}
