import 'package:defeefront/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:defeefront/widgets/basic_modal.dart';
import 'package:defeefront/widgets/float_modal.dart';

class MyFloatingButton extends StatefulWidget {
  final Function(String) onFolderAdded;
  final Function(String) onKeywordAdded;

  const MyFloatingButton({
    Key? key,
    required this.onFolderAdded,
    required this.onKeywordAdded,
  }) : super(key: key);

  void _showModal(
    BuildContext context,
    String title,
    String label,
    String hintText,
    String buttonText,
    Function(String) onSubmitted,
  ) {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: DefeeThemeSizes.borderRadius,
            ),
            contentPadding: DefeeThemeSizes.thickPadding,
            content: FloatModal(
              title: title,
              label: label,
              hintText: hintText,
              buttonText: buttonText,
              onSubmitted: (value) {
                onSubmitted(value);
              },
            ),
          );
        });
  }

  @override
  State<MyFloatingButton> createState() => _MyFloatingButtonState();
}

class _MyFloatingButtonState extends State<MyFloatingButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return BasicModal(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                          widget._showModal(
                            context,
                            "새 폴더",
                            "새 폴더 만들기",
                            " 폴더 이름을 입력해주세요",
                            "추가",
                            widget.onFolderAdded,
                          );
                        },
                        child: Row(
                          children: const [
                            Icon(Icons.folder),
                            SizedBox(width: 10),
                            Text(
                              "폴더 추가",
                              style: DefeeTextStyles.menuMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                          widget._showModal(
                            context,
                            "키워드 추가",
                            "키워드",
                            " 키워드를 입력해주세요",
                            "추가",
                            widget.onKeywordAdded,
                          );
                        },
                        child: Row(
                          children: const [
                            Icon(Icons.add),
                            SizedBox(width: 10),
                            Text(
                              "키워드 추가",
                              style: DefeeTextStyles.menuMedium,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Icon(
        Icons.add,
        color: Theme.of(context).colorScheme.onSecondary,
      ),
    );
  }
}
