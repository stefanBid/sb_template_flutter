import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// Project Helpers
import '../../helpers/app_colors.dart';
import '../../helpers/app_design.dart';
import '../../helpers/app_typography.dart';
import '../../helpers/app_validation.dart';

// Project Layouts
import '../../layouts/app_bars/classic_app_bar.dart';
import '../../layouts/body/standard_page_layout.dart';

// Project Widgets
import '../../widgets/base_button.dart';
import '../../widgets/base_checkbox.dart';
import '../../widgets/base_dropdown.dart';
import '../../widgets/base_form_field.dart';
import '../../widgets/base_multiselect.dart';
import '../../widgets/base_image_picker.dart';
import '../../widgets/base_scaffold_messenger.dart';

class FormSection extends StatefulWidget {
  const FormSection({super.key});

  @override
  State<FormSection> createState() => _FormSectionState();
}

class _FormSectionState extends State<FormSection> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController nameController;
  late final TextEditingController surnameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;

  bool _isSubmitting = false;
  bool _showPassword = false;
  bool _showConfirmPassword = false;

  String? _selectedRole;
  List<String> _selectedInterests = [];
  bool _acceptTerms = false;
  String? _profileImageUrl;

  static const _roleOptions = [
    BaseDropdownOption(value: 'admin', label: 'Admin'),
    BaseDropdownOption(value: 'editor', label: 'Editor'),
    BaseDropdownOption(value: 'viewer', label: 'Viewer'),
  ];

  static const _interestOptions = [
    BaseDropdownOption(value: 'design', label: 'Design'),
    BaseDropdownOption(value: 'development', label: 'Development'),
    BaseDropdownOption(value: 'marketing', label: 'Marketing'),
    BaseDropdownOption(value: 'management', label: 'Management'),
    BaseDropdownOption(value: 'data', label: 'Data & Analytics'),
  ];

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    surnameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    surnameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void _clearForm() {
    nameController.clear();
    surnameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();

    setState(() {
      if (_showPassword) _showPassword = false;
      if (_showConfirmPassword) _showConfirmPassword = false;
      _selectedRole = null;
      _selectedInterests = [];
      _acceptTerms = false;
      _profileImageUrl = null;
    });
  }

  Future<void> _submit() async {
    if (!_acceptTerms) {
      BaseScaffoldMessenger.show(
        context,
        message: 'You must accept the terms and conditions',
        type: SnackBarType.error,
      );
      return;
    }
    if (_formKey.currentState!.validate()) {
      setState(() => _isSubmitting = true);
      await Future.delayed(const Duration(seconds: 2));
      if (!mounted) return;
      setState(() => _isSubmitting = false);
      BaseScaffoldMessenger.show(
        context,
        message: 'Form submitted successfully!',
        type: SnackBarType.success,
      );
      _clearForm();
      FocusScope.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // — Personal Information
            Text(
              'Personal Information',
              style: AppTypography.of(context).heading3,
            ),
            const SizedBox(height: AppDesign.gapItemSm),
            BaseImagePicker(
              imageUrl: _profileImageUrl,
              onImageSelected: (XFile? file) =>
                  setState(() => _profileImageUrl = file?.path),
            ),
            const SizedBox(height: AppDesign.gapItemSm),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: BaseFormField(
                    fillColor: AppColors.of(context).surface,
                    controller: nameController,
                    label: 'Name',
                    prefixIcon: Icons.person_outline,
                    validator: (value) => AppValidation.notEmpty(
                      value,
                      message: 'Name is required',
                    ),
                  ),
                ),
                const SizedBox(width: AppDesign.gapInlineSm),
                Expanded(
                  child: BaseFormField(
                    controller: surnameController,
                    fillColor: AppColors.of(context).surface,
                    label: 'Surname',
                    prefixIcon: Icons.person_outline,
                    validator: (value) => AppValidation.notEmpty(
                      value,
                      message: 'Surname is required',
                    ),
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
              prefixIcon: Icons.mail_outline,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              validator: (value) =>
                  AppValidation.notEmpty(value, message: 'Email is required') ??
                  AppValidation.email(value),
            ),
            const SizedBox(height: AppDesign.gapItemSm),
            BaseFormField(
              controller: passwordController,
              fillColor: AppColors.of(context).surface,
              label: 'Password',
              prefixIcon: Icons.lock_outline,
              suffixIcon: IconButton(
                icon: Icon(
                  _showPassword
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  size: 20,
                ),
                onPressed: () => setState(() => _showPassword = !_showPassword),
              ),
              obscureText: !_showPassword,
              textInputAction: TextInputAction.next,
              validator: (value) =>
                  AppValidation.notEmpty(
                    value,
                    message: 'Password is required',
                  ) ??
                  AppValidation.minLength(
                    value,
                    6,
                    message: 'Minimum 6 characters',
                  ) ??
                  AppValidation.strongPassword(value),
            ),
            const SizedBox(height: AppDesign.gapItemSm),
            BaseFormField(
              controller: confirmPasswordController,
              fillColor: AppColors.of(context).surface,
              label: 'Confirm Password',
              prefixIcon: Icons.key,
              suffixIcon: IconButton(
                icon: Icon(
                  _showConfirmPassword
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  size: 20,
                ),
                onPressed: () => setState(
                  () => _showConfirmPassword = !_showConfirmPassword,
                ),
              ),
              obscureText: !_showConfirmPassword,
              textInputAction: TextInputAction.done,
              validator: (value) => AppValidation.match(
                value,
                passwordController.text,
                message: 'Passwords do not match',
              ),
            ),
            const SizedBox(height: AppDesign.gapSectionMd),

            // — Preferences
            Text('Preferences', style: AppTypography.of(context).heading3),
            const SizedBox(height: AppDesign.gapItemSm),
            BaseDropdown<String>(
              initialValue: _selectedRole,
              label: 'Role',
              hint: 'Select a role',
              fillColor: AppColors.of(context).surface,
              prefixIcon: Icons.work_outline,
              items: _roleOptions,
              onChanged: (v) => setState(() => _selectedRole = v),
              validator: (v) =>
                  AppValidation.notEmpty(v, message: 'Role is required'),
            ),
            const SizedBox(height: AppDesign.gapItemSm),
            BaseMultiselect<String>(
              initialValues: _selectedInterests,
              label: 'Interests',
              hint: 'Select your interests',
              fillColor: AppColors.of(context).surface,
              prefixIcon: Icons.star_border,
              items: _interestOptions,
              onChanged: (v) => setState(() => _selectedInterests = v),
              validator: (v) => AppValidation.listNotEmpty(
                v,
                message: 'Select at least one interest',
              ),
            ),
            const SizedBox(height: AppDesign.gapSectionMd),

            // — Terms
            BaseCheckbox(
              value: _acceptTerms,
              label: 'I accept the terms and conditions',
              onChanged: (v) => setState(() => _acceptTerms = v),
            ),
            const SizedBox(height: AppDesign.gapSectionLg),

            // — Submit
            BaseButton(
              fullWidth: true,
              onPressed: _isSubmitting ? null : _submit,
              label: 'Submit',
              icon: Icons.send,
              isLoading: _isSubmitting,
            ),
          ],
        ),
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
        leading: Icon(Icons.description),
        title: 'Build Professional Forms',
      ),
      body: FormSection(),
    );
  }
}
