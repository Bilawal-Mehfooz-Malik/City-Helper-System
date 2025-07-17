import 'package:app/src/core/models/my_data_types.dart';
import 'package:flutter/material.dart';

class TimingToggleWidget extends StatefulWidget {
  final EntityStatus initialStatus;
  final ValueChanged<EntityStatus> onStatusChanged;

  const TimingToggleWidget({
    super.key,
    required this.initialStatus,
    required this.onStatusChanged,
  });

  @override
  State<TimingToggleWidget> createState() => _TimingToggleWidgetState();
}

class _TimingToggleWidgetState extends State<TimingToggleWidget> {
  late bool useDefaultTiming;
  late bool isOpen;

  @override
  void initState() {
    super.initState();
    useDefaultTiming = widget.initialStatus == EntityStatus.defaultStatus;
    isOpen = widget.initialStatus == EntityStatus.open;
  }

  void _updateStatus() {
    if (useDefaultTiming) {
      widget.onStatusChanged(EntityStatus.defaultStatus);
    } else {
      widget.onStatusChanged(isOpen ? EntityStatus.open : EntityStatus.close);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ✅ Checkbox for "Use system default hours"
        Row(
          children: [
            Checkbox(
              value: useDefaultTiming,
              onChanged: (value) {
                setState(() {
                  useDefaultTiming = value ?? true;
                  _updateStatus();
                });
              },
            ),
            const Text("Use system default hours"),
          ],
        ),

        // ✅ If not using default, show a Switch to toggle open/closed
        if (!useDefaultTiming)
          Row(
            children: [
              Text(
                "Set shop status manually: ",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(width: 8),
              Switch(
                value: isOpen,
                onChanged: (value) {
                  setState(() {
                    isOpen = value;
                    _updateStatus();
                  });
                },
              ),
              Text(isOpen ? "Open" : "Closed"),
            ],
          ),
      ],
    );
  }
}
