import 'package:defeefront/themes/app_theme.dart';
import 'package:flutter/material.dart';

class BasicModal extends StatelessWidget {
  final Widget child; // Modal 내부에 표시할 위젯
  final String? title; // Modal 상단에 표시할 제목

  const BasicModal({
    Key? key,
    required this.child,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null && title!.isNotEmpty)
            Text(
              title!,
              style: DefeeTextStyles.bodyMedium,
            ),
          SizedBox(height: 40),
          SizedBox(height: 100, child: child),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
