import 'package:flutter/material.dart';

// Project - Helpers
import '../../../../helpers/theme/app_design.dart';
import '../../../../helpers/theme/app_colors.dart';
import '../../../../helpers/theme/app_typography.dart';

// Project - Widgets
import '../../../../widgets/app/simple-input/app_simple_input.dart';

class InputsSection extends StatefulWidget {
  const InputsSection({super.key});

  @override
  State<InputsSection> createState() => _InputsSectionState();
}

class _InputsSectionState extends State<InputsSection> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _multilineController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    _multilineController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Simple Input Components'),
        const SizedBox(height: AppDesign.lg),

        Builder(
          builder: (context) => Text(
            'Input Components for Search and Simple Data Entry',
            style: AppTypography.of(context).heading3,
          ),
        ),
        const SizedBox(height: AppDesign.sm),
        Builder(
          builder: (context) => Text(
            'Use AppSimpleInput for search bars, filters, and simple text entry without validation',
            style: AppTypography.of(context).caption,
          ),
        ),
        const SizedBox(height: AppDesign.xl),

        // Search Input
        _buildInputExample(
          'Search Input',
          'Simple search input with icon - ideal for search bars and filters',
          AppSimpleInput(
            controller: _searchController,
            hintText: 'Search...',
            prefixIcon: Icons.search,
            textInputAction: TextInputAction.search,
          ),
        ),

        // Multiline Input
        _buildInputExample(
          'Multiline Input',
          'Input with multiple lines - ideal for comments and messages',
          AppSimpleInput(
            controller: _multilineController,
            hintText: 'Enter your message here...',
            labelText: 'Message',
            minLines: 3,
            maxLines: 5,
            keyboardType: TextInputType.multiline,
            textInputAction: TextInputAction.newline,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Builder(
      builder: (context) => Text(
        title.toUpperCase(),
        style: AppTypography.of(context).small.copyWith(
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
          color: AppColors.of(context).textTertiary,
        ),
      ),
    );
  }

  Widget _buildInputExample(String title, String description, Widget input) {
    return Builder(
      builder: (context) => Column(
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
          const SizedBox(height: AppDesign.sm),
          input,
          const SizedBox(height: AppDesign.xl),
        ],
      ),
    );
  }
}
