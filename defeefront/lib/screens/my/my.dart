import 'package:flutter/material.dart';
import 'package:defeefront/widgets/footer.dart';
import 'package:defeefront/widgets/header.dart';
import 'package:defeefront/screens/my/widgets/my_menu.dart';
import 'package:defeefront/screens/my/widgets/my_floating_button.dart';
import 'package:defeefront/screens/my/widgets/my_content.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  final List<MyMenuItem> _folders = [
    MyMenuItem(title: "저장", isFolder: true),
    MyMenuItem(title: "자료구조", isFolder: true),
    MyMenuItem(title: "면접", isFolder: true),
  ];

  final List<String> _keywords = ["AWS", "Python", "React"];

  void _addFolder(String folderName) {
    setState(() {
      _folders.add(MyMenuItem(title: folderName, isFolder: true));
    });
  }

  void _addKeyword(String keyword) {
    setState(() {
      _keywords.add(keyword);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: MyContent(
        folders: _folders,
        keywords: _keywords,
      ),
      floatingActionButton: MyFloatingButton(
        onFolderAdded: _addFolder,
        onKeywordAdded: _addKeyword,
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
