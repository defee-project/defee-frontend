import 'package:defeefront/screens/headline/widgets/popular.dart';
import 'package:flutter/material.dart';

class OtherPost extends StatelessWidget {
  const OtherPost({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Popular(),
        Popular(),
        Popular(),
      ],
    );
  }
}
