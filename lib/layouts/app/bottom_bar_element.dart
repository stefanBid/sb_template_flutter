import 'package:flutter/material.dart';

// Project - Helpers
import '../../helpers/theme/app_colors.dart';
import '../../helpers/theme/app_typography.dart';
import '../../helpers/theme/app_design.dart';

// Project - Models
import '../../models/app_route.dart';

class BottomBarElement extends StatelessWidget {
  const BottomBarElement({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.tabs,
  });

  final int currentIndex;
  final Function(int) onTap;
  final List<AppRoute> tabs;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppDesign.xl,
        vertical: AppDesign.xxl,
      ),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: AppColors.of(context).surface,
        borderRadius: AppDesign.borderRadiusL,
        border: Border.all(color: AppColors.of(context).onSurface, width: 1.5),
        boxShadow: AppDesign.shadowStrong,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: constraints.maxWidth),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(tabs.length, (index) {
                  final tab = tabs[index];
                  final isSelected = index == currentIndex;

                  return GestureDetector(
                    onTap: () => onTap(index),
                    behavior: HitTestBehavior.opaque,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: AppDesign.md,
                        horizontal: AppDesign.lg,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            tab.icon,
                            color: isSelected
                                ? AppColors.primary
                                : AppColors.of(context).textSecondary,
                            size: AppDesign.iconM,
                          ),
                          const SizedBox(height: AppDesign.xs),
                          Text(
                            tab.label,
                            style: AppTypography.of(context).small.copyWith(
                              color: isSelected
                                  ? AppColors.primary
                                  : AppColors.of(context).textSecondary,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          );
        },
      ),
    );
  }
}
