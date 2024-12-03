import 'package:defeefront/themes/app_theme.dart';
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
        style: DefeeTextStyles.onSurfaceSmall,
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
