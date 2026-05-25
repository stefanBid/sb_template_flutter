import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// Project Helpers
import '../helpers/app_colors.dart';
import '../helpers/app_design.dart';
import '../helpers/app_typography.dart';

// Project Widgets
import 'base_bottom_sheet.dart';

class BaseImageSelectorBottomSheet {
  const BaseImageSelectorBottomSheet._();

  static void show(
    BuildContext context, {
    required void Function(ImageSource source) onImageSourceSelected,
    bool hasImage = false,
    void Function()? onRemove,
  }) {
    BaseBottomSheet.show(
      context,
      title: 'Select image',
      child: Builder(
        builder: (sheetContext) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(
                Icons.photo_outlined,
                size: AppDesign.iconSizeLg,
                color: AppColors.of(context).text,
              ),
              title: Text(
                'Gallery',
                style: AppTypography.of(context).body,
              ),
              onTap: () {
                BaseBottomSheet.hide(sheetContext);
                onImageSourceSelected(ImageSource.gallery);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.camera_alt_outlined,
                size: AppDesign.iconSizeLg,
                color: AppColors.of(context).text,
              ),
              title: Text(
                'Camera',
                style: AppTypography.of(context).body,
              ),
              onTap: () {
                BaseBottomSheet.hide(sheetContext);
                onImageSourceSelected(ImageSource.camera);
              },
            ),
            if (hasImage && onRemove != null)
              ListTile(
                leading: const Icon(
                  Icons.delete_outline,
                  size: AppDesign.iconSizeLg,
                  color: AppColors.error,
                ),
                title: Text(
                  'Remove image',
                  style: AppTypography.of(context).body.copyWith(
                    color: AppColors.error,
                  ),
                ),
                onTap: () {
                  BaseBottomSheet.hide(sheetContext);
                  onRemove();
                },
              ),
          ],
        ),
      ),
    );
  }
}
