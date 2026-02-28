import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
// Project - Widgets
import '../../../widgets/app/badge/app_badge.dart';

// Project - Helpers
import '../../../helpers/theme/app_colors.dart';

class VersionBadge extends StatefulWidget {
  const VersionBadge({super.key});

  @override
  State<VersionBadge> createState() => _VersionBadgeState();
}

class _VersionBadgeState extends State<VersionBadge> {
  String version = '_._._';
  @override
  void initState() {
    super.initState();
    _loadVersion();
  }

  Future<void> _loadVersion() async {
    try {
      final appInfo = await PackageInfo.fromPlatform();
      if (mounted) {
        setState(() {
          version = appInfo.version;
        });
      }
    } catch (e) {
      // Silently fail - keep default version if package info is unavailable
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBadge(
      text: 'Version $version',
      variant: BadgeVariant.custom,
      customColor: AppColors.of(context).appBarBackground,
    );
  }
}
