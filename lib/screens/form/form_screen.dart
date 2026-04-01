import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

// Project Helpers
import '../../helpers/app_colors.dart';
import '../../helpers/app_design.dart';
import '../../helpers/app_typography.dart';
import '../../helpers/app_validation.dart';

// Project Layouts
import '../../layouts/app_bars/classic_app_bar.dart';
import '../../layouts/app_bars/standard_page_layout.dart';

// Project Widgets
import '../../widgets/base_form_field.dart';
import '../../widgets/base_button.dart';

class FormSection extends StatefulWidget {
  const FormSection({super.key});

  @override
  State<FormSection> createState() => _FormSectionState();
}

class _FormSectionState extends State<FormSection> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // — Personal Information
          Text(
            'Personal Information',
            style: AppTypography.of(context).heading3,
          ),
          const SizedBox(height: AppDesign.gapItemSm),
          Row(
            children: [
              Expanded(
                child: BaseFormField(
                  fillColor: AppColors.of(context).surface,
                  controller: nameController,
                  label: 'Name',
                  prefixIcon: PhosphorIconsRegular.user,
                ),
              ),
              const SizedBox(width: AppDesign.gapInlineSm),
              Expanded(
                child: BaseFormField(
                  controller: surnameController,
                  fillColor: AppColors.of(context).surface,
                  label: 'Surname',
                  prefixIcon: PhosphorIconsRegular.user,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppDesign.gapSectionMd),

          // — Account Information
          Text(
            'Account Information',
            style: AppTypography.of(context).heading3,
          ),
          const SizedBox(height: AppDesign.gapItemSm),
          BaseFormField(
            controller: emailController,
            fillColor: AppColors.of(context).surface,
            label: 'Email',
            prefixIcon: PhosphorIconsRegular.envelope,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: AppDesign.gapItemSm),
          BaseFormField(
            controller: passwordController,
            fillColor: AppColors.of(context).surface,
            label: 'Password',
            prefixIcon: PhosphorIconsRegular.lock,
            obscureText: true,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: AppDesign.gapItemSm),
          BaseFormField(
            controller: confirmPasswordController,
            fillColor: AppColors.of(context).surface,
            label: 'Confirm Password',
            prefixIcon: PhosphorIconsRegular.lockKey,
            obscureText: true,
            textInputAction: TextInputAction.done,
          ),
          const SizedBox(height: AppDesign.gapSectionLg),

          // — Submit
          BaseButton(
            fullWidth: true,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                print(_formKey.currentState!);
              }
            },
            label: 'Submit',
          ),
        ],
      ),
    );
  }
}

class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const StandardPageLayout(
      appBar: ClassicAppBar(
        leading: Icon(PhosphorIconsRegular.fileText),
        title: 'Build Professional Forms',
      ),
      body: FormSection(),
    );
  }
}
