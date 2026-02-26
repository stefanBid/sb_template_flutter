import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Project - Helpers
import '../../../helpers/theme/app_colors.dart';
import '../../../helpers/theme/app_design.dart';
import '../../../helpers/theme/app_typography.dart';

class AppDatePicker extends StatelessWidget {
  const AppDatePicker({
    super.key,
    required this.selectedDate,
    required this.onDateSelected,
    this.labelText,
    this.hintText = 'Select date',
    this.errorText,
    this.mandatory = false,
    this.enabled = true,
    this.firstDate,
    this.lastDate,
    this.dateFormat,
  });

  final DateTime? selectedDate;
  final ValueChanged<DateTime?> onDateSelected;
  final String? labelText;
  final String? hintText;
  final String? errorText;
  final bool mandatory;
  final bool enabled;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final DateFormat? dateFormat;

  @override
  Widget build(BuildContext context) {
    final bool hasError = errorText != null;
    final Color borderColor = hasError
        ? AppColors.error
        : AppColors.of(context).textSecondary;
    final Color labelColor = hasError
        ? AppColors.error
        : AppColors.of(context).textSecondary;

    final DateFormat formatter = dateFormat ?? DateFormat('dd/MM/yyyy');
    final String displayText = selectedDate != null
        ? formatter.format(selectedDate!)
        : hintText ?? 'Select date';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Label
        if (labelText != null)
          Padding(
            padding: const EdgeInsets.only(bottom: AppDesign.xs),
            child: Text(
              mandatory ? '$labelText *' : labelText!,
              style: AppTypography.of(
                context,
              ).caption.copyWith(color: labelColor),
            ),
          ),

        // Date Picker Field
        InkWell(
          onTap: enabled ? () => _selectDate(context) : null,
          borderRadius: AppDesign.borderRadiusL,
          child: Container(
            padding: AppDesign.paddingM,
            decoration: BoxDecoration(
              color: enabled
                  ? AppColors.of(context).surface
                  : AppColors.of(context).surface.withAlpha(128),
              borderRadius: AppDesign.borderRadiusL,
              border: Border.all(
                color: hasError
                    ? AppColors.error
                    : enabled
                    ? borderColor
                    : AppColors.of(context).textDisabled,
                width: hasError ? 1 : 0.5,
              ),
            ),
            child: Row(
              children: [
                // Calendar Icon
                Icon(
                  Icons.calendar_today,
                  size: AppDesign.iconM,
                  color: enabled
                      ? AppColors.of(context).textSecondary
                      : AppColors.of(context).textDisabled,
                ),
                const SizedBox(width: AppDesign.sm),

                // Date Text
                Expanded(
                  child: Text(
                    displayText,
                    overflow: TextOverflow.ellipsis,
                    style: selectedDate != null
                        ? AppTypography.of(context).body.copyWith(
                            color: enabled
                                ? AppColors.of(context).textPrimary
                                : AppColors.of(context).textDisabled,
                          )
                        : AppTypography.of(context).bodySecondary.copyWith(
                            color: enabled
                                ? AppColors.of(context).textSecondary
                                : AppColors.of(context).textDisabled,
                          ),
                  ),
                ),

                // Clear Button
                if (selectedDate != null && enabled)
                  InkWell(
                    onTap: () => onDateSelected(null),
                    borderRadius: BorderRadius.circular(20),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Icon(
                        Icons.clear,
                        size: AppDesign.iconS,
                        color: AppColors.of(context).textSecondary,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),

        // Error Text
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(
              top: AppDesign.xs,
              left: AppDesign.sm,
            ),
            child: Text(
              errorText!,
              style: AppTypography.of(
                context,
              ).caption.copyWith(color: AppColors.error),
              maxLines: 2,
            ),
          ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime initialDate = selectedDate ?? DateTime.now();
    final DateTime first = firstDate ?? DateTime(1900);
    final DateTime last = lastDate ?? DateTime(2100);

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: first,
      lastDate: last,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.of(context).appBarBackground,
              onPrimary: Colors.white,
              surface: AppColors.of(context).surface,
              onSurface: AppColors.of(context).textPrimary,
            ),
            dialogTheme: DialogThemeData(
              backgroundColor: AppColors.of(context).surface,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDate) {
      onDateSelected(picked);
    }
  }
}
