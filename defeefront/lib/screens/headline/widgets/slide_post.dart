import 'package:flutter/material.dart';
import 'package:defeefront/themes/app_theme.dart';

class SlidePost extends StatelessWidget {
  const SlidePost({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              SlideItem(),
              SlideItem(),
              SlideItem(),
              SlideItem(),
            ],
          ),
        ),
        const SizedBox(height: 15),
        ElevatedButton(
          onPressed: () {
            print("Button clicked!");
          },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 55),
            backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
          ),
          child: Text(
            "전체 포스트 컨텐츠",
            style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
          ),
        ),
        SizedBox(height: 10),
        Divider(
          color: Theme.of(context).colorScheme.outlineVariant,
          thickness: 1,
        ),
      ],
    );
  }
}

class SlideItem extends StatelessWidget {
  const SlideItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 380,
        margin: const EdgeInsets.only(right: 20),
        padding: DefeeThemeSizes.thickPadding,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "미새문지",
                  style: DefeeTextStyles.onSurfaceMedium,
                ),
                SizedBox(width: 5),
                Image(
                  width: 20,
                  image: AssetImage("assets/images/velog.png"),
                )
              ],
            ),
            Text(
              "소프트웨어 품질 관리",
              style: DefeeTextStyles.onSurfaceSmall,
            )
          ],
        ));
  }
}
