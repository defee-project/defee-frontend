import 'package:defeefront/screens/headline/headline.dart';
import 'package:defeefront/screens/login/login.dart';
import 'package:defeefront/screens/my/my.dart';
import 'package:defeefront/screens/post/post.dart';
import 'package:defeefront/screens/recommend/recommend.dart';
import 'package:defeefront/screens/search/search.dart';
import 'package:defeefront/screens/search_result/search_result.dart';
import 'package:defeefront/screens/signup/signup.dart';
import 'package:defeefront/screens/settings/settings.dart';

import 'package:flutter/material.dart';

final routes = {
  '/': (BuildContext context) => Headline(),
  '/login': (BuildContext context) => Login(),
  '/signup': (BuildContext context) => Signup(),
  '/search': (BuildContext context) => Search(),
  '/searchresult': (BuildContext context) => SearchResult(
        results: '',
      ),
  '/recommend': (BuildContext context) => Recommend(),
  '/my': (BuildContext context) => const MyPage(),
  '/settings': (BuildContext context) => Settings(),
  '/post': (BuildContext context) =>
      PostPage(url: ModalRoute.of(context)?.settings.arguments as String),
};
