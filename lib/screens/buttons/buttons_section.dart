import 'package:flutter/material.dart';

// Project - Helpers
import '../../helpers/theme/app_design.dart';
import '../../helpers/theme/app_colors.dart';
import '../../helpers/theme/app_typography.dart';

// Project - Widgets
import '../../widgets/app/button/app_button.dart';

class ButtonsSection extends StatefulWidget {
  const ButtonsSection({super.key});

  @override
  State<ButtonsSection> createState() => _ButtonsSectionState();
}

class _ButtonsSectionState extends State<ButtonsSection> {
  bool _isLoading1 = false;
  bool _isLoading2 = false;

  void _handlePress(String buttonName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '$buttonName pressed!',
          style: AppTypography.of(context).body.copyWith(color: Colors.white),
        ),
        duration: const Duration(seconds: 1),
        backgroundColor: AppColors.of(context).appBarBackground,
      ),
    );
  }

  void _simulateLoading(bool isSolid) async {
    setState(() {
      if (isSolid) {
        _isLoading1 = true;
      } else {
        _isLoading2 = true;
      }
    });

    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      setState(() {
        if (isSolid) {
          _isLoading1 = false;
        } else {
          _isLoading2 = false;
        }
      });
      _handlePress(isSolid ? 'Loading Solid Button' : 'Loading Outline Button');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Button Components'),
        const SizedBox(height: AppDesign.lg),

        Text('AppButton Variants', style: AppTypography.of(context).heading3),
        const SizedBox(height: AppDesign.sm),
        Text(
          'Consistent button components with solid and outline variants',
          style: AppTypography.of(context).caption,
        ),
        const SizedBox(height: AppDesign.xl),

        // Solid Buttons
        _buildSubsectionTitle('Solid Buttons'),
        const SizedBox(height: AppDesign.md),

        _buildButtonExample(
          'Basic Solid Button',
          'Default solid button with primary background',
          AppButton(
            text: 'Solid Button',
            onPressed: () => _handlePress('Solid Button'),
          ),
        ),

        _buildButtonExample(
          'Solid with Prefix Icon',
          'Solid button with icon on the left',
          AppButton(
            text: 'Add Item',
            prefixIcon: Icons.add,
            onPressed: () => _handlePress('Add Item'),
          ),
        ),

        _buildButtonExample(
          'Solid with Suffix Icon',
          'Solid button with icon on the right',
          AppButton(
            text: 'Next',
            suffixIcon: Icons.arrow_forward,
            onPressed: () => _handlePress('Next'),
          ),
        ),

        _buildButtonExample(
          'Solid Loading State',
          'Button showing loading indicator',
          AppButton(
            text: 'Processing',
            isLoading: _isLoading1,
            onPressed: () => _simulateLoading(true),
          ),
        ),

        _buildButtonExample(
          'Solid Disabled',
          'Disabled button (onPressed = null)',
          const AppButton(text: 'Disabled', onPressed: null),
        ),

        _buildButtonExample(
          'Solid Full Width',
          'Button that takes full available width',
          AppButton(
            text: 'Full Width Button',
            fullWidth: true,
            onPressed: () => _handlePress('Full Width'),
          ),
        ),

        const SizedBox(height: AppDesign.xl),

        // Outline Buttons
        _buildSubsectionTitle('Outline Buttons'),
        const SizedBox(height: AppDesign.md),

        _buildButtonExample(
          'Basic Outline Button',
          'Default outline button with border',
          AppButton(
            text: 'Outline Button',
            variant: AppButtonVariant.outline,
            onPressed: () => _handlePress('Outline Button'),
          ),
        ),

        _buildButtonExample(
          'Outline with Prefix Icon',
          'Outline button with icon on the left',
          AppButton(
            text: 'Download',
            variant: AppButtonVariant.outline,
            prefixIcon: Icons.download,
            onPressed: () => _handlePress('Download'),
          ),
        ),

        _buildButtonExample(
          'Outline with Suffix Icon',
          'Outline button with icon on the right',
          AppButton(
            text: 'Open',
            variant: AppButtonVariant.outline,
            suffixIcon: Icons.open_in_new,
            onPressed: () => _handlePress('Open'),
          ),
        ),

        _buildButtonExample(
          'Outline Loading State',
          'Outline button showing loading indicator',
          AppButton(
            text: 'Loading',
            variant: AppButtonVariant.outline,
            isLoading: _isLoading2,
            onPressed: () => _simulateLoading(false),
          ),
        ),

        _buildButtonExample(
          'Outline Disabled',
          'Disabled outline button',
          const AppButton(
            text: 'Disabled',
            variant: AppButtonVariant.outline,
            onPressed: null,
          ),
        ),

        _buildButtonExample(
          'Outline Full Width',
          'Outline button that takes full available width',
          AppButton(
            text: 'Full Width Outline',
            variant: AppButtonVariant.outline,
            fullWidth: true,
            onPressed: () => _handlePress('Full Width Outline'),
          ),
        ),

        const SizedBox(height: AppDesign.xl),

        // Button Combinations
        _buildSubsectionTitle('Button Combinations'),
        const SizedBox(height: AppDesign.md),

        Text('Common button layouts', style: AppTypography.of(context).caption),
        const SizedBox(height: AppDesign.md),

        Row(
          children: [
            Expanded(
              child: AppButton(
                text: 'Cancel',
                variant: AppButtonVariant.outline,
                onPressed: () => _handlePress('Cancel'),
              ),
            ),
            const SizedBox(width: AppDesign.md),
            Expanded(
              child: AppButton(
                text: 'Confirm',
                onPressed: () => _handlePress('Confirm'),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppDesign.md),

        Row(
          children: [
            Expanded(
              child: AppButton(
                text: 'Back',
                variant: AppButtonVariant.outline,
                prefixIcon: Icons.arrow_back,
                onPressed: () => _handlePress('Back'),
              ),
            ),
            const SizedBox(width: AppDesign.md),
            Expanded(
              child: AppButton(
                text: 'Continue',
                suffixIcon: Icons.arrow_forward,
                onPressed: () => _handlePress('Continue'),
              ),
            ),
          ],
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

  Widget _buildSubsectionTitle(String title) {
    return Builder(
      builder: (context) => Text(
        title,
        style: AppTypography.of(context).heading3.copyWith(fontSize: 18),
      ),
    );
  }

  Widget _buildButtonExample(String title, String description, Widget button) {
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
          Align(alignment: Alignment.centerLeft, child: button),
          const SizedBox(height: AppDesign.lg),
        ],
      ),
    );
  }
}
