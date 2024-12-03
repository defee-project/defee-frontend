import 'package:defeefront/themes/app_theme.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final String? currentRoute = ModalRoute.of(context)?.settings.name;

    return Container(
      color: Theme.of(context).colorScheme.surfaceContainer,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            icon: Icons.search,
            label: "검색",
            context: context,
            route: '/search',
            isSelected: currentRoute == '/search',
          ),
          _buildNavItem(
            icon: Icons.language,
            label: "헤드라인",
            context: context,
            route: '/',
            isSelected: currentRoute == '/',
          ),
          _buildNavItem(
            icon: Icons.thumb_up_outlined,
            label: "추천",
            context: context,
            route: '/recommend',
            isSelected: currentRoute == '/recommend',
          ),
          _buildNavItem(
            icon: Icons.star_border,
            label: "My",
            context: context,
            route: '/my',
            isSelected: currentRoute == '/my',
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required BuildContext context,
    required String route,
    required bool isSelected,
  }) {
    final ValueNotifier<bool> isHovered = ValueNotifier(false);

    return MouseRegion(
      onEnter: (_) => isHovered.value = true,
      onExit: (_) => isHovered.value = false,
      child: ValueListenableBuilder<bool>(
        valueListenable: isHovered,
        builder: (context, hover, child) {
          final bool isActive = isSelected || hover;

          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, route),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 25),
              decoration: isActive
                  ? BoxDecoration(
                      borderRadius: DefeeThemeSizes.borderRadius,
                      color: Theme.of(context).colorScheme.secondary,
                    )
                  : null,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    icon,
                    size: 28,
                    color: isActive
                        ? Theme.of(context).colorScheme.onSecondary
                        : Theme.of(context).colorScheme.onSurface,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 14,
                      color: isActive
                          ? Theme.of(context).colorScheme.onSecondary
                          : Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
