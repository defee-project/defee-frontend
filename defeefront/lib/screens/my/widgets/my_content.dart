import 'package:defeefront/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:defeefront/screens/my/widgets/my_menu.dart';
import 'package:defeefront/screens/my/widgets/my_post.dart';

class MyContent extends StatelessWidget {
  final List<MyMenuItem> folders;
  final List<String> keywords;

  const MyContent({
    Key? key,
    required this.folders,
    required this.keywords,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: DefeeThemeSizes.thickPadding,
      child: Column(
        children: [
          MyMenu(
            title: "스크랩",
            items: folders,
            onPressed: (title, isFolder) {
              if (isFolder) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyPost(folderName: title),
                  ),
                );
              }
            },
          ),
          SizedBox(height: 16),
          Divider(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            thickness: 1,
          ),
          MyMenu(
            title: "키워드",
            items: keywords
                .map((keyword) => MyMenuItem(title: keyword, isFolder: false))
                .toList(),
            onPressed: (title, isFolder) {
              if (!isFolder) {
                print("키워드 $title 검색 실행");
              }
            },
          ),
        ],
      ),
    );
  }
}
