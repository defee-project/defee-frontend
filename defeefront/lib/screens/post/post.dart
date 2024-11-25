import 'package:flutter/material.dart';
import 'package:defeefront/screens/post/widgets/post_app_bar.dart';
import 'package:defeefront/screens/post/widgets/post_content.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:defeefront/screens/post/widgets/post_navigation_bar.dart';

class PostPage extends StatefulWidget {
  final String url;

  const PostPage({Key? key, required this.url}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  WebViewController? _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PostAppBar(url: widget.url),
      body: PostContent(
        url: widget.url,
        onControllerReady: (controller) {
          setState(() {
            _controller = controller;
          });
        },
      ),
      bottomNavigationBar: _controller == null
          ? const SizedBox.shrink() // 컨트롤러가 준비되지 않은 경우 빈 위젯 표시
          : PostNavigationBar(controller: _controller!),
    );
  }
}
