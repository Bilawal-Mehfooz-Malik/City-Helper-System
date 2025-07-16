import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/models/opening_hours.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';

class OpeningHoursTile extends StatelessWidget {
  final List<OpeningHours> openingHours;
  final ValueChanged<List<OpeningHours>> onOpeningHoursChanged;

  const OpeningHoursTile({
    super.key,
    required this.openingHours,
    required this.onOpeningHoursChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Opening Hours: ${openingHours.isEmpty ? "Not Set" : "${openingHours.length} set"}'
            .hardcoded,
      ),
      trailing: const Icon(Icons.access_time),
      onTap: () => _editOpeningHours(context),
    );
  }

  Future<void> _editOpeningHours(BuildContext context) async {
    List<OpeningHours> tempHours = List.from(openingHours);

    await showDialog<void>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: Text('Edit Opening Hours'.hardcoded),
          content: SizedBox(
            width: double.maxFinite,
            height: 400,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: tempHours.asMap().entries.map((entry) {
                  final index = entry.key;
                  final dayHours = entry.value;

                  return OpeningHoursEditor(
                    dayHours: dayHours,
                    onChanged: (updatedHours) {
                      setState(() {
                        tempHours[index] = updatedHours;
                      });
                    },
                  );
                }).toList(),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                onOpeningHoursChanged(tempHours);
                Navigator.pop(context);
              },
              child: Text('Done'.hardcoded),
            ),
          ],
        ),
      ),
    );
  }
}

class OpeningHoursEditor extends StatelessWidget {
  final OpeningHours dayHours;
  final ValueChanged<OpeningHours> onChanged;

  const OpeningHoursEditor({
    super.key,
    required this.dayHours,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Sizes.p12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            dayHours.day,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          gapH4,
          Row(
            children: [
              Expanded(
                child: TimePickerField(
                  label: 'Open'.hardcoded,
                  time: dayHours.open,
                  onChanged: (newTime) {
                    onChanged(
                      OpeningHours(
                        day: dayHours.day,
                        open: newTime,
                        close: dayHours.close,
                      ),
                    );
                  },
                ),
              ),
              gapH8,
              Expanded(
                child: TimePickerField(
                  label: 'Close'.hardcoded,
                  time: dayHours.close,
                  onChanged: (newTime) {
                    onChanged(
                      OpeningHours(
                        day: dayHours.day,
                        open: dayHours.open,
                        close: newTime,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}

class TimePickerField extends StatelessWidget {
  final String label;
  final String time; // expects "HH:mm" format
  final ValueChanged<String> onChanged;

  const TimePickerField({
    super.key,
    required this.label,
    required this.time,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    // FIX: The time string is already in "HH:mm" format, so it can be displayed directly.
    final String displayTime = time;

    return InkWell(
      onTap: () async {
        final timeParts = time.split(':');
        final initialTime = TimeOfDay(
          hour: int.parse(timeParts[0]),
          minute: int.parse(timeParts[1]),
        );

        final picked = await showTimePicker(
          context: context,
          initialTime: initialTime,
          // FIX: The builder enforces a 24-hour clock UI.
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(
                context,
              ).copyWith(alwaysUse24HourFormat: true),
              child: child!,
            );
          },
        );

        if (picked != null) {
          final formatted =
              '${picked.hour.toString().padLeft(2, '0')}:${picked.minute.toString().padLeft(2, '0')}';
          onChanged(formatted);
        }
      },
      child: InputDecorator(
        decoration: InputDecoration(labelText: label),
        child: Text(displayTime),
      ),
    );
  }
}
