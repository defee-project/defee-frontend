import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      alignment: Alignment.center,
      child: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 13,
          color: Color.fromARGB(255, 92, 92, 92),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Text("최신 포스트"),
            Text("BACKEND"),
            Text("FRONTEND"),
            Text("DEVOPS"),
            Text("CS"),
          ],
        ),
      ),
    );
  }
}
