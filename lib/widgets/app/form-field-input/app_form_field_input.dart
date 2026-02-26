import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Project - Helpers
import '../../../helpers/theme/app_colors.dart';
import '../../../helpers/theme/app_design.dart';
import '../../../helpers/theme/app_typography.dart';

class AppFormFieldInput extends StatelessWidget {
  const AppFormFieldInput({
    super.key,
    required this.controller,
    this.validator,
    this.autovalidateMode,
    this.onChanged,
    this.hintText = 'Enter text',
    this.labelText,
    this.maxLength,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.prefixIcon,
    this.suffixIcon,
    this.onSubmitted,
    this.onTap,
    this.mandatory = false,
    this.hideCounter = true,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.none,
    this.autocorrect = false,
    this.enableSuggestions = true,
    this.focusNode,
    this.minLines,
    this.maxLines = 1,
  });

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final ValueChanged<String>? onChanged;

  final String? hintText;
  final String? labelText;

  final int? maxLength;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;

  final IconData? prefixIcon;
  final Widget? suffixIcon;

  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onTap;

  final bool mandatory;
  final bool hideCounter;
  final bool enabled;
  final bool readOnly;
  final bool autofocus;

  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final bool autocorrect;
  final bool enableSuggestions;
  final FocusNode? focusNode;
  final int? minLines;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    final Color borderColor = AppColors.of(context).textSecondary;
    final Color labelColor = AppColors.of(context).textSecondary;

    return TextFormField(
      controller: controller,
      validator: validator,
      autovalidateMode: autovalidateMode,
      onChanged: onChanged,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      maxLength: maxLength,
      enabled: enabled,
      readOnly: readOnly,
      autofocus: autofocus,
      onFieldSubmitted: onSubmitted,
      onTap: onTap,
      inputFormatters: inputFormatters,
      textCapitalization: textCapitalization,
      autocorrect: autocorrect,
      enableSuggestions: enableSuggestions,
      focusNode: focusNode,
      minLines: minLines,
      maxLines: maxLines,
      style: AppTypography.of(context).body,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTypography.of(context).bodySecondary,
        labelText: labelText != null && mandatory ? '$labelText *' : labelText,
        labelStyle: AppTypography.of(
          context,
        ).caption.copyWith(color: labelColor),
        floatingLabelStyle: AppTypography.of(
          context,
        ).caption.copyWith(color: labelColor),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        errorStyle: AppTypography.of(
          context,
        ).caption.copyWith(color: AppColors.error),
        errorMaxLines: 2,

        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                size: AppDesign.iconM,
                color: AppColors.of(context).textSecondary,
              )
            : null,
        suffixIcon: suffixIcon,

        filled: true,
        fillColor: AppColors.of(context).surface,

        border: OutlineInputBorder(
          borderRadius: AppDesign.borderRadiusL,
          borderSide: BorderSide(color: borderColor, width: 0.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppDesign.borderRadiusL,
          borderSide: BorderSide(color: borderColor, width: 0.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppDesign.borderRadiusL,
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: AppDesign.borderRadiusL,
          borderSide: const BorderSide(color: AppColors.error, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: AppDesign.borderRadiusL,
          borderSide: const BorderSide(color: AppColors.error, width: 2),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: AppDesign.borderRadiusL,
          borderSide: BorderSide(
            color: AppColors.of(context).textDisabled,
            width: 0.5,
          ),
        ),

        contentPadding: AppDesign.paddingM,
        counterText: hideCounter ? '' : null,
      ),
    );
  }
}
