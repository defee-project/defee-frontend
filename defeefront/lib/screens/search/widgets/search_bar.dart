import 'package:flutter/material.dart';

class MainSearchBar extends StatefulWidget {
  final Function(String)? onKeywordSelected; // 키워드 선택 시 호출할 콜백 함수

  const MainSearchBar({super.key, this.onKeywordSelected});

  @override
  MainSearchBarState createState() => MainSearchBarState(); // 상태 클래스 이름을 올바르게 지정
}

class MainSearchBarState extends State<MainSearchBar> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController, // TextEditingController 연결
      decoration: InputDecoration(
        labelText: '검색',
        prefixIcon: Icon(Icons.search),
        suffixIcon: IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            searchController.clear(); // TextField 내용 지우기
          },
        ),
      ),
    );
  }

  void setKeyword(String keyword) {
    searchController.text = keyword; // 키워드 설정
    if (widget.onKeywordSelected != null) {
      widget.onKeywordSelected!(keyword); // 콜백 호출
    }
  }
}