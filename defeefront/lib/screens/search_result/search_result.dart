import 'package:defeefront/screens/headline/widgets/other_post.dart';
import 'package:defeefront/screens/headline/widgets/popular.dart';
import 'package:flutter/material.dart';
import '../../widgets/footer.dart';
import '../../widgets/header.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({super.key});

  @override
  _SearchResult createState() => _SearchResult();
}

class _SearchResult extends State<SearchResult> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: '리액트',
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.clear),
              ),
            ),

            SizedBox(height: 16.0),

            Popular(),
            OtherPost(),


          ],
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}

