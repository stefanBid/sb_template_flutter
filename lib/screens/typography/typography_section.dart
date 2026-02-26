import 'package:flutter/material.dart';

// Project - Helpers
import '../../helpers/theme/app_colors.dart';
import '../../helpers/theme/app_typography.dart';
import '../../helpers/theme/app_design.dart';

class TypographySection extends StatelessWidget {
  const TypographySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Typography'),
        const SizedBox(height: AppDesign.lg),
        _buildTypographyCard(
          context,
          'Heading 1',
          AppTypography.of(context).heading1,
        ),
        const SizedBox(height: AppDesign.md),
        _buildTypographyCard(
          context,
          'Heading 2',
          AppTypography.of(context).heading2,
        ),
        const SizedBox(height: AppDesign.md),
        _buildTypographyCard(
          context,
          'Heading 3',
          AppTypography.of(context).heading3,
        ),
        const SizedBox(height: AppDesign.md),
        _buildTypographyCard(
          context,
          'Body Text',
          AppTypography.of(context).body,
        ),
        const SizedBox(height: AppDesign.md),
        _buildTypographyCard(
          context,
          'Body Secondary',
          AppTypography.of(context).bodySecondary,
        ),
        const SizedBox(height: AppDesign.md),
        _buildTypographyCard(
          context,
          'Caption',
          AppTypography.of(context).caption,
        ),
        const SizedBox(height: AppDesign.md),
        _buildTypographyCard(
          context,
          'Small Text',
          AppTypography.of(context).small,
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title.toUpperCase(),
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
        color: Colors.grey,
      ),
    );
  }

  Widget _buildTypographyCard(
    BuildContext context,
    String label,
    TextStyle style,
  ) {
    return Container(
      width: double.infinity,
      padding: AppDesign.paddingL,
      decoration: BoxDecoration(
        color: AppColors.of(context).surface,
        borderRadius: AppDesign.borderRadiusL,
        boxShadow: AppDesign.shadowLight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: AppTypography.of(context).caption),
          const SizedBox(height: AppDesign.sm),
          Text('The quick brown fox jumps over the lazy dog', style: style),
        ],
      ),
    );
  }
}
