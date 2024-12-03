import 'package:defeefront/themes/app_theme.dart';
import 'package:flutter/material.dart';

class FloatModal extends StatelessWidget {
  final String title; // 모달 제목
  final String label; // 입력 필드 레이블
  final String hintText; // 입력 필드 힌트
  final String buttonText; // 버튼 텍스트
  final void Function(String) onSubmitted; // 완료 버튼 클릭 시 콜백
  final TextEditingController? controller; // 외부에서 제공할 입력 컨트롤러 (옵션)

  const FloatModal({
    Key? key,
    required this.title,
    required this.label,
    required this.hintText,
    required this.buttonText,
    required this.onSubmitted,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller =
        controller ?? TextEditingController();

    return Padding(
      padding: DefeeThemeSizes.thinPadding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.primary),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.primary),
              ),
              hintStyle: DefeeTextStyles.hint,
              hintText: hintText,
            ),
            cursorColor: Theme.of(context).colorScheme.primary,
          ),
          SizedBox(height: 10),
          TextButton(
            onPressed: () {
              final inputText = _controller.text.trim();
              if (inputText.isNotEmpty) {
                onSubmitted(inputText);
                Navigator.pop(context); // 모달 닫기
              }
            },
            child: Text(buttonText),
          ),
        ],
      ),
    );
  }
}
