import 'package:defeefront/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "defee{ }",
      theme: ThemeData(
        fontFamily: "Pretendard",
      ),
      routes: routes,
    );
  }
}
