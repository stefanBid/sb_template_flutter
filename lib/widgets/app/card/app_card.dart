import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

// Project - Helpers
import '../../../helpers/theme/app_colors.dart';
import '../../../helpers/theme/app_design.dart';
import '../../../helpers/theme/app_typography.dart';

class AppCard extends StatelessWidget {
  static final Uuid _uuid = const Uuid();

  AppCard({
    super.key,
    String? id,
    this.title,
    this.description,
    this.prefixContent,
    this.suffixContent,
    this.bodyContent,
    this.onTap,
  }) : cardId = id ?? _uuid.v4();

  final String cardId;
  final String? title;
  final String? description;
  final Widget? prefixContent;
  final Widget? suffixContent;
  final Widget? bodyContent;
  final void Function(String id)? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.of(context).surface,
      borderRadius: AppDesign.borderRadiusL,
      shadowColor: Colors.black,
      elevation: AppDesign.cardElevation,
      child: _buildCardContainer(context),
    );
  }

  Widget _buildCardContainer(BuildContext context) {
    final cardContent = Ink(
      decoration: BoxDecoration(
        borderRadius: AppDesign.borderRadiusL,
        border: Border.all(
          color: AppColors.of(context).textTertiary.withAlpha(77),
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: AppDesign.paddingL,
        child: Row(
          children: [
            if (prefixContent != null) ...[
              prefixContent!,
              const SizedBox(width: AppDesign.lg),
            ],
            Expanded(child: _buildCardContent(context)),
            if (suffixContent != null) ...[
              const SizedBox(width: AppDesign.lg),
              suffixContent!,
            ],
          ],
        ),
      ),
    );

    return onTap != null
        ? InkWell(
            onTap: () => onTap?.call(cardId),
            borderRadius: AppDesign.borderRadiusL,
            child: cardContent,
          )
        : cardContent;
  }

  Widget _buildCardContent(BuildContext context) {
    return bodyContent ??
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null) ...[
              Text(title!, style: AppTypography.of(context).heading4),
              if (description != null) const SizedBox(height: AppDesign.xs),
            ],
            if (description != null)
              Text(description!, style: AppTypography.of(context).caption),
          ],
        );
  }
}
