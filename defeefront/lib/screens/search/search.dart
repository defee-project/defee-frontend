import 'package:defeefront/screens/search/widgets/search_history.dart';
import 'package:flutter/material.dart';
import '../../widgets/footer.dart';
import '../../widgets/header.dart';
import '../../screens/search/widgets/search_bar.dart';

class Search extends StatefulWidget { // StatefulWidget으로 변경
  const Search({super.key});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String? selectedKeyword;
  String? selectedMyKeyword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            //상단 검색 바
            MainSearchBar(),

            SizedBox(height: 16.0),



            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xff002686), // 배경 색상
                borderRadius: BorderRadius.circular(8.0), // 모서리 둥글게
              ),
              child: DropdownButton<String>(
                padding : EdgeInsets.fromLTRB(15, 0, 0, 0),
                hint: Text(
                  '인기 키워드',
                  style: TextStyle(color: Colors.white),
                ),
                value: selectedKeyword,
                dropdownColor: Color(0xff002686),
                icon: Icon(Icons.arrow_drop_down, color: Colors.white), // 오른쪽 아이콘
                isExpanded: true, // 드롭다운 버튼 전체 너비 사용
                underline: SizedBox(), // 밑줄 제거
                onChanged: (String? newValue) {
                  selectedKeyword = newValue; // 상태 관리 없음
                },
                items: <String>['키워드1', '키워드2', '키워드3']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        value,
                        style: TextStyle(color: Colors.white), // 텍스트 색상
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 16.0), // 간격 추가

            // 내 키워드 드롭다운
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xff002686), // 배경 색상
                borderRadius: BorderRadius.circular(8.0), // 모서리 둥글게
              ),
              child: DropdownButton<String>(
                padding : EdgeInsets.fromLTRB(15, 0, 0, 0),
                hint: Text(
                  '내 키워드',
                  style: TextStyle(color: Colors.white),
                ),
                value: selectedMyKeyword,
                dropdownColor: Color(0xff002686),
                icon: Icon(Icons.arrow_drop_down, color: Colors.white), // 오른쪽 아이콘
                isExpanded: true, // 드롭다운 버튼 전체 너비 사용
                underline: SizedBox(), // 밑줄 제거
                onChanged: (String? newValue) {
                  setState(() {
                    selectedMyKeyword = newValue;
                  });
                },
                items: <String>['내 키워드1', '내 키워드2']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        value,
                        style: TextStyle(color: Colors.white), // 텍스트 색상
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 16.0), // 간격 추가

            // 선택된 키워드 칩들
            Container(
              width: double.infinity,
              child: Wrap(
                spacing: 15.0,//chip 수평 간격
                runSpacing: 12.0,//chip 수직 간격
                children: [
                  Chip(
                    label: Text(
                        'Prisma',
                        style: TextStyle(color: Colors.white, fontSize: 18.0)
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0), // 패딩 조정
                    backgroundColor: Color(0xff002686), // 칩 배경색
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0), // 모서리 둥글게
                      side: BorderSide.none, // 외곽선 제거
                    )
                  ),
                  Chip(
                    label: Text(
                        '리액트',
                        style: TextStyle(color: Colors.white, fontSize: 18.0)
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0), // 패딩 조정
                    backgroundColor: Color(0xffBABABA), // 칩 배경색
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0), // 모서리 둥글게
                      side: BorderSide.none, // 외곽선 제거
                    )
                  ),
                  Chip(
                    label: Text(
                        '싱글톤 패턴',
                        style: TextStyle(color: Colors.white, fontSize: 18.0)
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0), // 패딩 조정
                    backgroundColor: Color(0xffBABABA), // 칩 배경색
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0), // 모서리 둥글게
                      side: BorderSide.none, // 외곽선 제거
                    )
                  ),
                  Chip(
                    label: Text(
                        'Node.js',
                        style: TextStyle(color: Colors.white, fontSize: 18.0)
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0), // 패딩 조정
                    backgroundColor: Color(0xffBABABA), // 칩 배경색
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0), // 모서리 둥글게
                      side: BorderSide.none, // 외곽선 제거
                    )
                  ),
                  Chip(
                    label: Text(
                        'MVC Pattern',
                        style: TextStyle(color: Colors.white, fontSize: 18.0)
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0), // 패딩 조정
                    backgroundColor: Color(0xff002686), // 칩 배경색
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0), // 모서리 둥글게
                      side: BorderSide.none, // 외곽선 제거
                    )
                  ),
                  Chip(
                    label: Text(
                        'Block Chain',
                        style: TextStyle(color: Colors.white, fontSize: 18.0)
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0), // 패딩 조정
                    backgroundColor: Color(0xffBABABA), // 칩 배경색
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0), // 모서리 둥글게
                      side: BorderSide.none, // 외곽선 제거
                    )
                  ),
                  IconButton(
                    icon: Icon(Icons.add, color: Color(0xff002686)), // '+' 아이콘
                    onPressed: () {
                      // '+' 아이콘 클릭 시 동작을 여기에 추가
                    },
                    color: Color(0xff002686), // 아이콘 배경색
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0), // 패딩 조정
                    constraints: BoxConstraints(), // 크기 조정
                  ),
                ],
              ),
            ),

            SizedBox(height: 16.0), // 간격 추가

            Divider(
              thickness: 1.0,
              color: Colors.grey,
            ),

            SizedBox(height: 16.0), // 간격 추가

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '기록',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    // 전체 삭제 버튼 클릭 시 동작을 여기에 추가
                  },
                  child: Text(
                    '전체 삭제',
                    style: TextStyle(color: Colors.grey), // 색상
                  ),
                ),
              ],
            ),

            SearchHistory(),
          ],
        ),
      ),



      bottomNavigationBar: Footer(),

    );
  }
}
