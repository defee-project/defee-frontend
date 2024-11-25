import 'package:defeefront/screens/headline/widgets/category.dart';
import 'package:defeefront/screens/headline/widgets/other_post.dart';
import 'package:defeefront/screens/headline/widgets/popular.dart';
import 'package:defeefront/screens/headline/widgets/slide_post.dart';
import 'package:defeefront/widgets/basescreen.dart';
import 'package:flutter/material.dart';

class Headline extends StatelessWidget {
  const Headline({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScreen(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: [
            // 카테고리
            Category(),
            // 인기 포스트
            Popular(),
            // 포스트 컨텐츠
            SlidePost(),
            // 하단 나머지 포스트
            OtherPost(),
          ],
        ),
      ),
    );
  }
}
