import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Project - Helpers
import '../../../../helpers/theme/app_design.dart';
import '../../../../helpers/theme/app_colors.dart';
import '../../../../helpers/theme/app_typography.dart';

// Project - Widgets
import '../../../../widgets/app/date-picker/app_date_picker.dart';

class DatePickersSection extends StatefulWidget {
  const DatePickersSection({super.key});

  @override
  State<DatePickersSection> createState() => _DatePickersSectionState();
}

class _DatePickersSectionState extends State<DatePickersSection> {
  DateTime? _customFormatDate;
  DateTime? _basicDate;
  DateTime? _birthdateDate;
  DateTime? _startDate;
  DateTime? _endDate;

  String? _validateBirthdate(DateTime? value) {
    if (value == null) {
      return 'Birthdate is required';
    }
    final age = DateTime.now().year - value.year;
    if (age < 18) {
      return 'You must be at least 18 years old';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final errorMessage = _validateBirthdate(_birthdateDate);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Date Picker Components'),
        const SizedBox(height: AppDesign.lg),

        Text(
          'AppDatePicker Variants',
          style: AppTypography.of(context).heading3,
        ),
        const SizedBox(height: AppDesign.sm),
        Text(
          'Date picker component styled consistently with input fields',
          style: AppTypography.of(context).caption,
        ),
        const SizedBox(height: AppDesign.xl),

        // Basic Date Picker
        _buildDatePickerExample(
          'Basic Date Picker',
          'Simple date picker with default format (dd/MM/yyyy)',
          AppDatePicker(
            selectedDate: _basicDate,
            onDateSelected: (date) => setState(() => _basicDate = date),
            hintText: 'Select a date',
          ),
          _basicDate,
        ),

        // Date Picker with Custom Format
        _buildDatePickerExample(
          'Custom Format Date Picker',
          'Date picker with custom date format (EEEE, d MMMM yyyy)',
          AppDatePicker(
            selectedDate: _customFormatDate,
            onDateSelected: (date) => setState(() => _customFormatDate = date),
            labelText: 'Appointment',
            hintText: 'Select appointment date',
            dateFormat: DateFormat('EEEE, d MMMM yyyy'),
          ),
          _customFormatDate,
        ),

        // Date Picker with Error
        _buildDatePickerExample(
          'Date Picker with Validation',
          'Date picker showing validation error (must be 18+)',
          AppDatePicker(
            selectedDate: _birthdateDate,
            onDateSelected: (date) => setState(() => _birthdateDate = date),
            labelText: 'Birthdate',
            hintText: 'Select your birthdate',
            errorText: errorMessage,
            mandatory: true,
            lastDate: DateTime.now(),
          ),
          _birthdateDate,
        ),

        // Date Range Example
        _buildSubsectionTitle('Date Range Example'),
        const SizedBox(height: AppDesign.md),
        Text(
          'Combine multiple date pickers for date ranges',
          style: AppTypography.of(context).caption,
        ),
        const SizedBox(height: AppDesign.md),

        Row(
          children: [
            Expanded(
              child: AppDatePicker(
                selectedDate: _startDate,
                onDateSelected: (date) => setState(() => _startDate = date),
                labelText: 'From',
                hintText: 'Start date',
              ),
            ),
            const SizedBox(width: AppDesign.md),
            Expanded(
              child: AppDatePicker(
                selectedDate: _endDate,
                onDateSelected: (date) => setState(() => _endDate = date),
                labelText: 'To',
                hintText: 'End date',
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

  Widget _buildDatePickerExample(
    String title,
    String description,
    Widget datePicker,
    DateTime? selectedDate,
  ) {
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
          datePicker,
          if (selectedDate != null) ...[
            const SizedBox(height: AppDesign.xs),
            Text(
              'Selected: ${DateFormat('dd/MM/yyyy').format(selectedDate)}',
              style: AppTypography.of(
                context,
              ).small.copyWith(color: AppColors.of(context).textTertiary),
            ),
          ],
          const SizedBox(height: AppDesign.lg),
        ],
      ),
    );
  }
}
