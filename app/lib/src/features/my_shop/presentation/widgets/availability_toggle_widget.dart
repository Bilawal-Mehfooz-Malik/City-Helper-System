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
      _selectedStatus = widget.initialStatus;
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
            child: RadioGroup<bool>(
              groupValue: _selectedStatus,
              onChanged: (bool? newStatus) {
                if (newStatus == null) return;
                setState(() {
                  _selectedStatus = newStatus;
                });
                widget.onStatusChanged(newStatus);
              },
              child: Column(
                children: const [
                  _StatusOptionTile(
                    title: 'Available',
                    subtitle: 'Available for rent or sale.',
                    radioValue: true,
                  ),
                  Divider(height: 1),
                  _StatusOptionTile(
                    title: 'Unavailable',
                    subtitle: 'Not available for rent or sale.',
                    radioValue: false,
                  ),
                ],
              ),
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
    required this.radioValue,
  });

  final String title;
  final String subtitle;
  final bool radioValue;

  @override
  Widget build(BuildContext context) {
    // maybeOf returns nullable, so we guard it
    final registry = RadioGroup.maybeOf<bool>(context);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          if (registry != null) {
            registry.onChanged(radioValue);
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.p8,
            vertical: Sizes.p4,
          ),
          child: Row(
            children: [
              // New Radio usage: only value is required
              Radio<bool>(value: radioValue),
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
