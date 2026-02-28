import 'package:flutter/material.dart';

// Project - Helpers
import '../../helpers/theme/app_design.dart';
import '../../helpers/theme/app_colors.dart';
import '../../helpers/theme/app_typography.dart';

// Project - Services
import '../../services/ui/alert_service.dart';

// Project - Widgets
import '../../widgets/app/card/app_card.dart';
import '../../widgets/app/badge/app_badge.dart';

class ComponentsSection extends StatelessWidget {
  const ComponentsSection({super.key});

  void _handleCardTap(BuildContext context, String id, String cardName) {
    AlertService.showAppDialog(
      context: context,
      title: cardName,
      message: 'You tapped on $cardName with ID: $id',
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(title, style: AppTypography.of(context).heading1);
  }

  Widget _buildSubsectionTitle(BuildContext context, String title) {
    return Text(title, style: AppTypography.of(context).heading3);
  }

  Widget _buildDescription(BuildContext context, String description) {
    return Text(description, style: AppTypography.of(context).caption);
  }

  Widget _buildExampleCard({
    required BuildContext context,
    required String title,
    required String description,
    required Widget widget,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTypography.of(
            context,
          ).body.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: AppDesign.xs),
        Text(description, style: AppTypography.of(context).caption),
        const SizedBox(height: AppDesign.md),
        widget,
        const SizedBox(height: AppDesign.xl),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(context, 'UI Components'),
        const SizedBox(height: AppDesign.lg),

        // === CARDS SECTION ===
        _buildSubsectionTitle(context, 'Cards'),
        const SizedBox(height: AppDesign.sm),
        _buildDescription(
          context,
          'Versatile containers for grouping related information',
        ),
        const SizedBox(height: AppDesign.xl),

        _buildExampleCard(
          context: context,
          title: 'Basic Card (non-tappable)',
          description: 'Card with title and description without onTap',
          widget: AppCard(
            title: 'Card Title',
            description:
                'This card has no onTap defined, so it\'s not tappable.',
          ),
        ),

        _buildExampleCard(
          context: context,
          title: 'Card with Prefix Icon (tappable)',
          description: 'Card with icon on the left and ripple effect on tap',
          widget: AppCard(
            title: 'Notification',
            description: 'You have a new message to read',
            prefixContent: Container(
              padding: const EdgeInsets.all(AppDesign.md),
              decoration: BoxDecoration(
                color: AppColors.primary.withAlpha(26),
                borderRadius: AppDesign.borderRadiusM,
              ),
              child: const Icon(
                Icons.notifications_outlined,
                color: AppColors.primary,
                size: AppDesign.iconXL,
              ),
            ),
            onTap: (id) => _handleCardTap(context, id, 'Prefix Card'),
          ),
        ),

        _buildExampleCard(
          context: context,
          title: 'Card with Suffix Icon (tappable)',
          description: 'Card with icon on the right and ripple effect on tap',
          widget: AppCard(
            title: 'Settings',
            description: 'Configure application preferences',
            suffixContent: const Icon(
              Icons.arrow_forward_ios,
              size: AppDesign.iconM,
            ),
            onTap: (id) => _handleCardTap(context, id, 'Suffix Card'),
          ),
        ),

        _buildExampleCard(
          context: context,
          title: 'Card with Custom Content (non-tappable)',
          description: 'Card with custom bodyContent without onTap',
          widget: AppCard(
            bodyContent: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.info_outline,
                      color: AppColors.secondary,
                      size: AppDesign.iconL,
                    ),
                    const SizedBox(width: AppDesign.sm),
                    Expanded(
                      child: Text(
                        'Custom Content',
                        style: AppTypography.of(context).heading3,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppDesign.md),
                Text(
                  'You can insert any widget in bodyContent to fully customize the card appearance.',
                  style: AppTypography.of(context).bodySecondary,
                ),
                const SizedBox(height: AppDesign.md),
                const Wrap(
                  spacing: AppDesign.sm,
                  runSpacing: AppDesign.sm,
                  children: [
                    AppBadge(text: 'Custom', variant: BadgeVariant.primary),
                    AppBadge(text: 'Flexible', variant: BadgeVariant.success),
                  ],
                ),
              ],
            ),
          ),
        ),

        _buildExampleCard(
          context: context,
          title: 'Comparison: Tappable vs Non-Tappable',
          description: 'Cards with onTap show ripple effect, others don\'t',
          widget: Column(
            children: [
              AppCard(
                title: 'Tappable Card',
                description: 'Tap to see ripple effect',
                prefixContent: Container(
                  padding: const EdgeInsets.all(AppDesign.sm),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withAlpha(26),
                    borderRadius: AppDesign.borderRadiusM,
                  ),
                  child: const Icon(
                    Icons.touch_app,
                    color: AppColors.primary,
                    size: AppDesign.iconL,
                  ),
                ),
                onTap: (id) => _handleCardTap(context, id, 'Tappable Card'),
              ),
              const SizedBox(height: AppDesign.md),
              AppCard(
                title: 'Non-Tappable Card',
                description: 'No tap effect',
                prefixContent: Container(
                  padding: const EdgeInsets.all(AppDesign.sm),
                  decoration: BoxDecoration(
                    color: AppColors.of(context).textTertiary.withAlpha(26),
                    borderRadius: AppDesign.borderRadiusM,
                  ),
                  child: Icon(
                    Icons.block,
                    color: AppColors.of(context).textTertiary,
                    size: AppDesign.iconL,
                  ),
                ),
              ),
            ],
          ),
        ),

        // === BADGES SECTION ===
        _buildSubsectionTitle(context, 'Badges'),
        const SizedBox(height: AppDesign.sm),
        _buildDescription(
          context,
          'Compact labels for states, categories, and metadata',
        ),
        const SizedBox(height: AppDesign.xl),

        _buildExampleCard(
          context: context,
          title: 'Badge Variants',
          description: 'Different color variants for different purposes',
          widget: const Wrap(
            spacing: AppDesign.md,
            runSpacing: AppDesign.md,
            children: [
              AppBadge(text: 'Primary', variant: BadgeVariant.primary),
              AppBadge(text: 'Secondary', variant: BadgeVariant.secondary),
              AppBadge(text: 'Success', variant: BadgeVariant.success),
              AppBadge(text: 'Warning', variant: BadgeVariant.warning),
              AppBadge(text: 'Error', variant: BadgeVariant.error),
            ],
          ),
        ),

        _buildExampleCard(
          context: context,
          title: 'Badges with Icons',
          description: 'Badges with icons for better visual clarity',
          widget: const Wrap(
            spacing: AppDesign.md,
            runSpacing: AppDesign.md,
            children: [
              AppBadge(
                text: 'New',
                icon: Icons.star,
                variant: BadgeVariant.primary,
              ),
              AppBadge(
                text: 'Completed',
                icon: Icons.check_circle,
                variant: BadgeVariant.success,
              ),
              AppBadge(
                text: 'Pending',
                icon: Icons.access_time,
                variant: BadgeVariant.warning,
              ),
              AppBadge(
                text: 'Error',
                icon: Icons.error,
                variant: BadgeVariant.error,
              ),
            ],
          ),
        ),

        _buildExampleCard(
          context: context,
          title: 'Real-world Badge Usage',
          description: 'Examples of badge usage in cards',
          widget: Column(
            children: [
              AppCard(
                title: 'Project A',
                description: 'New feature development',
                prefixContent: Container(
                  padding: const EdgeInsets.all(AppDesign.md),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withAlpha(26),
                    borderRadius: AppDesign.borderRadiusM,
                  ),
                  child: const Icon(
                    Icons.folder_outlined,
                    color: AppColors.primary,
                    size: AppDesign.iconXL,
                  ),
                ),
                suffixContent: const AppBadge(
                  text: 'Active',
                  icon: Icons.play_arrow,
                  variant: BadgeVariant.success,
                ),
                onTap: (id) => _handleCardTap(context, id, 'Project A'),
              ),
              const SizedBox(height: AppDesign.md),
              AppCard(
                title: 'Project B',
                description: 'Critical bug fixes',
                prefixContent: Container(
                  padding: const EdgeInsets.all(AppDesign.md),
                  decoration: BoxDecoration(
                    color: AppColors.warning.withAlpha(26),
                    borderRadius: AppDesign.borderRadiusM,
                  ),
                  child: const Icon(
                    Icons.bug_report_outlined,
                    color: AppColors.warning,
                    size: AppDesign.iconXL,
                  ),
                ),
                suffixContent: const AppBadge(
                  text: 'Urgent',
                  icon: Icons.priority_high,
                  variant: BadgeVariant.error,
                ),
                onTap: (id) => _handleCardTap(context, id, 'Project B'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
