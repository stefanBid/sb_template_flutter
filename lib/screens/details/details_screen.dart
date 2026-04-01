import 'package:flutter/material.dart';

// Project Helpers
import '../../helpers/app_colors.dart';
import '../../helpers/app_design.dart';
import '../../helpers/app_router.dart';
import '../../helpers/app_typography.dart';

// Project Layouts
import '../../layouts/app_bars/classic_app_bar.dart';
import '../../layouts/app_bars/standard_page_layout.dart';

class DetailsScreen extends StatelessWidget {
  final String detailId;

  const DetailsScreen({super.key, required this.detailId});

  @override
  Widget build(BuildContext context) {
    return StandardPageLayout(
      appBar: ClassicAppBar(title: 'Details: $detailId'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Welcome to the Details Screen for item $detailId!',
            style: AppTypography.of(context).heading4,
          ),
        ],
      ),
    );
  }
}
