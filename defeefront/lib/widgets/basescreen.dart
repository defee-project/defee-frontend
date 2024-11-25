import 'package:defeefront/widgets/footer.dart';
import 'package:defeefront/widgets/header.dart';
import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {
  final Widget child;

  const BaseScreen({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: SingleChildScrollView(
        child: child,
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
