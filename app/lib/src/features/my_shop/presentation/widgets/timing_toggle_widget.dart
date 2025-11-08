import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';

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

  @override
  void didUpdateWidget(covariant TimingToggleWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialStatus != oldWidget.initialStatus) {
      setState(() {
        _selectedStatus = widget.initialStatus;
      });
    }
  }

  void _onGroupChanged(OperationalStatus? newStatus) {
    if (newStatus == null) return;
    setState(() {
      _selectedStatus = newStatus;
    });
    widget.onStatusChanged(newStatus);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Operational Status'.hardcoded,
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
            child: RadioGroup<OperationalStatus>(
              groupValue: _selectedStatus,
              onChanged: _onGroupChanged,
              child: Column(
                children: [
                  _StatusOptionTile(
                    title: 'Default Hours'.hardcoded,
                    subtitle:
                        'Automatically opens/closes based on your business hours.'
                            .hardcoded,
                    radioValue: OperationalStatus.defaultStatus,
                  ),
                  const Divider(height: 1),
                  _StatusOptionTile(
                    title: 'Manual - Open'.hardcoded,
                    subtitle:
                        "Force your shop to appear 'Open', overriding your hours."
                            .hardcoded,
                    radioValue: OperationalStatus.open,
                  ),
                  const Divider(height: 1),
                  _StatusOptionTile(
                    title: 'Manual - Closed'.hardcoded,
                    subtitle:
                        "Force your shop to appear 'Closed', overriding your hours."
                            .hardcoded,
                    radioValue: OperationalStatus.close,
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
  final OperationalStatus radioValue;

  @override
  Widget build(BuildContext context) {
    // Retrieve the RadioGroup registry to call its onChanged
    final group = RadioGroup.maybeOf<OperationalStatus>(context);

    return Material(
      color: group?.groupValue == radioValue
          ? context.colorScheme.primary.withAlpha(40)
          : Colors.transparent,
      child: InkWell(
        onTap: () {
          if (group != null) {
            group.onChanged(radioValue);
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.p8,
            vertical: Sizes.p4,
          ),
          child: Row(
            children: [
              // Radio without groupValue/onChanged — just its value
              Radio<OperationalStatus>(value: radioValue),
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
