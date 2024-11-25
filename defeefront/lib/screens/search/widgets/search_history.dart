import 'package:flutter/material.dart';

class SearchHistory extends StatelessWidget {
  const SearchHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0), // 수직 간격 조정
            title: Text('디자인 패턴 - MVC, MVVM 패턴',
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min, // 최소 크기로 설정
              children: [
                Text('3일전'),
                IconButton(
                  icon: Icon(Icons.close, color: Colors.grey), // 'X' 아이콘
                  onPressed: () {
                    // 'X' 아이콘 클릭 시 동작을 여기에 추가
                  },
                ),
              ],
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0), // 수직 간격 조정
            title: Text('디자인 패턴 - MVC, MVVM 패턴',
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min, // 최소 크기로 설정
              children: [
                Text('3일전'),
                IconButton(
                  icon: Icon(Icons.close, color: Colors.grey), // 'X' 아이콘
                  onPressed: () {
                    // 'X' 아이콘 클릭 시 동작을 여기에 추가
                  },
                ),
              ],
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0), // 수직 간격 조정
            title: Text('디자인 패턴 - MVC, MVVM 패턴',
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min, // 최소 크기로 설정
              children: [
                Text('3일전'),
                IconButton(
                  icon: Icon(Icons.close, color: Colors.grey), // 'X' 아이콘
                  onPressed: () {
                    // 'X' 아이콘 클릭 시 동작을 여기에 추가
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
