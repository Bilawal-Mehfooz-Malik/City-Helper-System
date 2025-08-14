import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';

/// A widget that provides a clear, descriptive list of status options for the user.
class TimingToggleWidget extends StatefulWidget {
  final OperationalStatus initialStatus;
  final ValueChanged<OperationalStatus> onStatusChanged;

  const TimingToggleWidget({
    super.key,
    required this.initialStatus,
    required this.onStatusChanged,
  });

  @override
  State<TimingToggleWidget> createState() => _TimingToggleWidgetState();
}

class _TimingToggleWidgetState extends State<TimingToggleWidget> {
  late OperationalStatus _selectedStatus;

  @override
  void initState() {
    super.initState();
    _selectedStatus = widget.initialStatus;
  }

  // This method is called when the user selects a new option.
  void _handleStatusChanged(OperationalStatus? newStatus) {
    if (newStatus != null) {
      // Update the local UI state to show the change immediately.
      setState(() {
        _selectedStatus = newStatus;
      });
      // Notify the parent widget to trigger the backend update.
      widget.onStatusChanged(newStatus);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Shop Status'.hardcoded, style: context.textTheme.titleMedium),
        gapH8,
        // Visually group the options together with a border and rounded corners.
        DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              color: context.colorScheme.outline.withAlpha(128),
            ),
            borderRadius: BorderRadius.circular(Sizes.p12),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(Sizes.p12),
            child: Column(
              children: [
                _StatusOptionTile(
                  title: 'Default Hours'.hardcoded,
                  subtitle:
                      'Automatically opens/closes based on your business hours.'
                          .hardcoded,
                  value: OperationalStatus.defaultStatus,
                  groupValue: _selectedStatus,
                  onChanged: _handleStatusChanged,
                ),
                Divider(height: 1),
                _StatusOptionTile(
                  title: 'Manual - Open'.hardcoded,
                  subtitle:
                      "Force your shop to appear 'Open', overriding your hours."
                          .hardcoded,
                  value: OperationalStatus.open,
                  groupValue: _selectedStatus,
                  onChanged: _handleStatusChanged,
                ),
                Divider(height: 1),
                _StatusOptionTile(
                  title: 'Manual - Closed'.hardcoded,
                  subtitle:
                      "Force your shop to appear 'Closed', overriding your hours."
                          .hardcoded,
                  value: OperationalStatus.close,
                  groupValue: _selectedStatus,
                  onChanged: _handleStatusChanged,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// A reusable tile for displaying a single status option with a title, subtitle,
/// and radio button, designed to be used within a list.
class _StatusOptionTile extends StatelessWidget {
  const _StatusOptionTile({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  final String title;
  final String subtitle;
  final OperationalStatus value;
  final OperationalStatus groupValue;
  final ValueChanged<OperationalStatus?> onChanged;

  @override
  Widget build(BuildContext context) {
    final bool isSelected = value == groupValue;
    return Material(
      color: isSelected
          ? context.colorScheme.primary.withAlpha(40)
          : Colors.transparent,
      child: InkWell(
        onTap: () => onChanged(value),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.p8,
            vertical: Sizes.p4,
          ),
          child: Row(
            children: [
              Radio<OperationalStatus>(
                value: value,
                groupValue: groupValue,
                onChanged: onChanged,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: context.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    gapH4,
                    Text(
                      subtitle,
                      style: context.textTheme.bodySmall?.copyWith(
                        color: context.textTheme.bodySmall?.color?.withAlpha(
                          200,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
