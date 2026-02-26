import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Project - Helpers
import '../../../../helpers/theme/app_design.dart';
import '../../../../helpers/theme/app_colors.dart';
import '../../../../helpers/theme/app_typography.dart';

// Project - Widgets
import '../../../../widgets/app/form-field-input/app_form_field_input.dart';
import '../../../../widgets/app/button/app_button.dart';

class FormSection extends StatefulWidget {
  const FormSection({super.key});

  @override
  State<FormSection> createState() => _FormSectionState();
}

class _FormSectionState extends State<FormSection> {
  final _formKey = GlobalKey<FormState>();
  
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _showPassword = false;
  bool _showConfirmPassword = false;
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _ageController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    if (value.length < 2) {
      return 'Name must be at least 2 characters';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    if (value.length < 10) {
      return 'Phone number must be at least 10 digits';
    }
    return null;
  }

  String? _validateAge(String? value) {
    if (value == null || value.isEmpty) {
      return 'Age is required';
    }
    final age = int.tryParse(value);
    if (age == null) {
      return 'Please enter a valid number';
    }
    if (age < 18 || age > 120) {
      return 'Age must be between 18 and 120';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  void _submitForm() {
    setState(() {
      _autovalidateMode = AutovalidateMode.onUserInteraction;
    });

    if (_formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Form submitted successfully!',
            style: AppTypography.of(context).body.copyWith(
              color: Colors.white,
            ),
          ),
          backgroundColor: AppColors.success,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Please fix the errors in the form',
            style: AppTypography.of(context).body.copyWith(
              color: Colors.white,
            ),
          ),
          backgroundColor: AppColors.error,
        ),
      );
    }
  }

  void _resetForm() {
    _formKey.currentState?.reset();
    _nameController.clear();
    _emailController.clear();
    _phoneController.clear();
    _ageController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
    setState(() {
      _autovalidateMode = AutovalidateMode.disabled;
      _showPassword = false;
      _showConfirmPassword = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Form with Validation'),
        const SizedBox(height: AppDesign.lg),

        Text(
          'Registration Form Example',
          style: AppTypography.of(context).heading3,
        ),
        const SizedBox(height: AppDesign.sm),
        Text(
          'This form demonstrates field validation using AppFormFieldInput',
          style: AppTypography.of(context).caption,
        ),
        const SizedBox(height: AppDesign.xl),

        Form(
          key: _formKey,
          autovalidateMode: _autovalidateMode,
          child: Column(
            children: [
              // Name Field
              AppFormFieldInput(
                controller: _nameController,
                labelText: 'Full Name',
                hintText: 'Enter your full name',
                prefixIcon: Icons.person_outline,
                validator: _validateName,
                textInputAction: TextInputAction.next,
                mandatory: true,
              ),
              const SizedBox(height: AppDesign.lg),

              // Email Field
              AppFormFieldInput(
                controller: _emailController,
                labelText: 'Email',
                hintText: 'your.email@example.com',
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                validator: _validateEmail,
                textInputAction: TextInputAction.next,
                mandatory: true,
              ),
              const SizedBox(height: AppDesign.lg),

              // Phone Field
              AppFormFieldInput(
                controller: _phoneController,
                labelText: 'Phone Number',
                hintText: '+39 123 456 7890',
                prefixIcon: Icons.phone_outlined,
                keyboardType: TextInputType.phone,
                validator: _validatePhone,
                textInputAction: TextInputAction.next,
                mandatory: true,
              ),
              const SizedBox(height: AppDesign.lg),

              // Age Field
              AppFormFieldInput(
                controller: _ageController,
                labelText: 'Age',
                hintText: 'Enter your age',
                prefixIcon: Icons.cake_outlined,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(3),
                ],
                validator: _validateAge,
                textInputAction: TextInputAction.next,
                mandatory: true,
              ),
              const SizedBox(height: AppDesign.lg),

              // Password Field
              AppFormFieldInput(
                controller: _passwordController,
                labelText: 'Password',
                hintText: 'Enter your password',
                prefixIcon: Icons.lock_outline,
                obscureText: !_showPassword,
                suffixIcon: IconButton(
                  icon: Icon(
                    _showPassword ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () => setState(() => _showPassword = !_showPassword),
                ),
                validator: _validatePassword,
                textInputAction: TextInputAction.next,
                mandatory: true,
              ),
              const SizedBox(height: AppDesign.lg),

              // Confirm Password Field
              AppFormFieldInput(
                controller: _confirmPasswordController,
                labelText: 'Confirm Password',
                hintText: 'Re-enter your password',
                prefixIcon: Icons.lock_outline,
                obscureText: !_showConfirmPassword,
                suffixIcon: IconButton(
                  icon: Icon(
                    _showConfirmPassword ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () => setState(() => _showConfirmPassword = !_showConfirmPassword),
                ),
                validator: _validateConfirmPassword,
                textInputAction: TextInputAction.done,
                onSubmitted: (_) => _submitForm(),
                mandatory: true,
              ),
              const SizedBox(height: AppDesign.xxl),

              // Form Buttons
              Row(
                children: [
                  Expanded(
                    child: AppButton(
                      text: 'Reset',
                      variant: AppButtonVariant.outline,
                      onPressed: _resetForm,
                    ),
                  ),
                  const SizedBox(width: AppDesign.md),
                  Expanded(
                    child: AppButton(
                      text: 'Submit',
                      onPressed: _submitForm,
                    ),
                  ),
                ],
              ),
            ],
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
}
