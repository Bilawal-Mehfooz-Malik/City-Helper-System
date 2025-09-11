import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';

class AvailabilityToggleWidget extends StatefulWidget {
  final bool initialStatus;
  final ValueChanged<bool> onStatusChanged;

  const AvailabilityToggleWidget({
    super.key,
    required this.initialStatus,
    required this.onStatusChanged,
  });

  @override
  State<AvailabilityToggleWidget> createState() =>
      _AvailabilityToggleWidgetState();
}

class _AvailabilityToggleWidgetState extends State<AvailabilityToggleWidget> {
  late bool _selectedStatus;

  @override
  void initState() {
    super.initState();
    _selectedStatus = widget.initialStatus;
  }

  @override
  void didUpdateWidget(covariant AvailabilityToggleWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialStatus != oldWidget.initialStatus) {
      setState(() {
        _selectedStatus = widget.initialStatus;
      });
    }
  }

  void _handleStatusChanged(bool? newStatus) {
    if (newStatus != null) {
      setState(() {
        _selectedStatus = newStatus;
      });
      widget.onStatusChanged(newStatus);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Availability Status'.hardcoded,
          style: context.textTheme.titleMedium,
        ),
        gapH8,
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
                  title: 'Available'.hardcoded,
                  subtitle: 'Available for rent or sale.'.hardcoded,
                  value: true,
                  groupValue: _selectedStatus,
                  onChanged: _handleStatusChanged,
                ),
                Divider(height: 1),
                _StatusOptionTile(
                  title: 'Unavailable'.hardcoded,
                  subtitle: 'Not available for rent or sale.'.hardcoded,
                  value: false,
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
  final bool value;
  final bool groupValue;
  final ValueChanged<bool?> onChanged;

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
              Radio<bool>(
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
