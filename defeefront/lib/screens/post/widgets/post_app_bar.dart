import 'package:defeefront/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart'; // share_plus 패키지 추가
import 'package:defeefront/widgets/basic_modal.dart';

class PostAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String url;

  const PostAppBar({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.close),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Clipboard.setData(ClipboardData(text: url));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('URL이 복사되었습니다'),
                    duration: const Duration(seconds: 3),
                  ),
                );
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Text(
                  url,
                  style: DefeeTextStyles.onSecondarySmall,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: Image.asset(
              'assets/icons/share.png',
              width: 24,
              height: 24,
              fit: BoxFit.contain,
            ),
            onPressed: () {
              // Share 기능
              _shareUrl(context, url);
            },
          ),
          IconButton(
            icon: const Icon(Icons.bookmark_outline),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                builder: (context) => BasicModal(
                  title: "어디에 저장할까요?",
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _folderIcon("저장"),
                      _folderIcon("자료구조"),
                      _folderIcon("면접"),
                      _addFolderIcon(),
                    ],
                  ),
                ),
              );
            },
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Image.asset(
                  'assets/icons/cpu.png',
                  width: 24,
                  height: 24,
                  fit: BoxFit.contain,
                ),
                onPressed: () {
                  // AI 요약 로직
                },
              ),
              Transform.translate(
                offset: const Offset(0, -10),
                child: const Text(
                  'AI',
                  style: DefeeTextStyles.bodyTiny,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 공유 로직
  void _shareUrl(BuildContext context, String url) {
    Share.share('페이지 공유: \n $url').catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('공유에 실패했습니다.'),
          duration: const Duration(seconds: 3),
        ),
      );
    });
  }

  Widget _folderIcon(String label) {
    return Column(
      children: [
        Icon(Icons.folder, size: 50, color: DefeeColors.blue),
        SizedBox(height: 5),
        Text(label),
      ],
    );
  }

  Widget _addFolderIcon() {
    return Column(
      children: const [
        Icon(Icons.add_circle_outline, size: 50, color: DefeeColors.grey),
        SizedBox(height: 5),
        Text("추가"),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
