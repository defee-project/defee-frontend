import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PostContent extends StatefulWidget {
  final String url;
  final Function(WebViewController) onControllerReady; // 콜백 추가

  const PostContent(
      {Key? key, required this.url, required this.onControllerReady})
      : super(key: key);

  @override
  State<PostContent> createState() => _PostContentState();
}

class _PostContentState extends State<PostContent> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));

    // 컨트롤러를 부모로 전달
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onControllerReady(_controller);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: _controller);
  }
}
