import 'package:flutter/material.dart';
import 'package:defeefront/screens/post/post.dart';

class MyPost extends StatelessWidget {
  final String folderName;

  MyPost({required this.folderName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(folderName),
      ),
      body: ListView.builder(
        itemCount: 10, // 예시 데이터
        itemBuilder: (context, index) {
          final postUrl = "https://pongpongi.tistory.com/$index"; // 예시 URL
          return ListTile(
            title: Text('가상 메모리'),
            subtitle: Text('이것저것 블로그 $index'),
            onTap: () {
              // ListTile 클릭 시 PostPage로 이동
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostPage(url: postUrl),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
