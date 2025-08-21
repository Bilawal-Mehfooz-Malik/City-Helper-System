import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/models/opening_hours.dart';
import 'package:app/src/core/models/time_slot.dart';
import 'package:app/src/core/utils/date_formatter.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';

class OpeningHoursTile extends StatelessWidget {
  final Map<DayOfWeek, OpeningHours> openingHours;
  final ValueChanged<Map<DayOfWeek, OpeningHours>> onOpeningHoursChanged;

  const OpeningHoursTile({
    super.key,
    required this.openingHours,
    required this.onOpeningHoursChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        '${context.loc.editOpeningHours}: ${openingHours.isEmpty ? "Not Set" : "${openingHours.length} days set"}'
            .hardcoded,
      ),
      trailing: const Icon(Icons.access_time),
      onTap: () => _editOpeningHours(context),
    );
  }

  Future<void> _editOpeningHours(BuildContext context) async {
    // Create a mutable copy of the opening hours map
    final Map<DayOfWeek, OpeningHours> tempHours = Map.from(openingHours);

    await showDialog<void>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: Text(context.loc.editOpeningHours),
          content: SizedBox(
            width: double.maxFinite,
            height:
                MediaQuery.of(context).size.height *
                0.7, // Use a percentage of screen height
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: DayOfWeek.values.map((day) {
                  final dayHours =
                      tempHours[day] ??
                      const OpeningHours(isDayOff: true, slots: []);
                  return OpeningHoursEditor(
                    day: day,
                    dayHours: dayHours,
                    onChanged: (updatedHours) {
                      setState(() {
                        tempHours[day] = updatedHours;
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
              child: Text(context.loc.done),
            ),
          ],
        ),
      ),
    );
  }
}

class OpeningHoursEditor extends StatelessWidget {
  final DayOfWeek day;
  final OpeningHours dayHours;
  final ValueChanged<OpeningHours> onChanged;

  const OpeningHoursEditor({
    super.key,
    required this.day,
    required this.dayHours,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final loc = context.loc;
    final dayName = day.name[0].toUpperCase() + day.name.substring(1);

    return Padding(
      padding: const EdgeInsets.only(bottom: Sizes.p12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(dayName, style: const TextStyle(fontWeight: FontWeight.w600)),
          Row(
            children: [
              Expanded(
                child: SwitchListTile(
                  title: Text(loc.closed),
                  value: dayHours.isDayOff,
                  onChanged: (value) {
                    onChanged(
                      dayHours.copyWith(
                        isDayOff: value,
                        is24Hours: false,
                        slots: [],
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: SwitchListTile(
                  title: Text(context.loc.open24Hours),
                  value: dayHours.is24Hours,
                  onChanged: dayHours.isDayOff
                      ? null
                      : (value) {
                          onChanged(
                            dayHours.copyWith(
                              is24Hours: value,
                              isDayOff: false,
                              slots: [],
                            ),
                          );
                        },
                ),
              ),
            ],
          ),
          if (!dayHours.isDayOff && !(dayHours.is24Hours)) ...[
            ...dayHours.slots.asMap().entries.map((entry) {
              final index = entry.key;
              final slot = entry.value;
              return TimeSlotEditor(
                slot: slot,
                onChanged: (updatedSlot) {
                  final newSlots = List<TimeSlot>.from(dayHours.slots);
                  newSlots[index] = updatedSlot;
                  onChanged(dayHours.copyWith(slots: newSlots));
                },
                onDelete: () {
                  final newSlots = List<TimeSlot>.from(dayHours.slots);
                  newSlots.removeAt(index);
                  onChanged(dayHours.copyWith(slots: newSlots));
                },
              );
            }),
            TextButton.icon(
              onPressed: () {
                final newSlots = List<TimeSlot>.from(dayHours.slots);
                newSlots.add(
                  const TimeSlot(open: '09:00', close: '17:00'),
                ); // Default new slot
                onChanged(dayHours.copyWith(slots: newSlots));
              },
              icon: const Icon(Icons.add),
              label: Text(context.loc.addSlot),
            ),
          ],
          const Divider(),
        ],
      ),
    );
  }
}

class TimeSlotEditor extends StatelessWidget {
  final TimeSlot slot;
  final ValueChanged<TimeSlot> onChanged;
  final VoidCallback onDelete;

  const TimeSlotEditor({
    super.key,
    required this.slot,
    required this.onChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TimePickerField(
            label: context.loc.open,
            time: slot.open,
            onChanged: (newTime) => onChanged(slot.copyWith(open: newTime)),
          ),
        ),
        gapW8,
        Expanded(
          child: TimePickerField(
            label: context.loc.close,
            time: slot.close,
            onChanged: (newTime) => onChanged(slot.copyWith(close: newTime)),
          ),
        ),
        IconButton(icon: const Icon(Icons.delete), onPressed: onDelete),
      ],
    );
  }
}

class TimePickerField extends StatelessWidget {
  final String label;
  final String time;
  final ValueChanged<String> onChanged;

  const TimePickerField({
    super.key,
    required this.label,
    required this.time,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
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
        child: Text(formatTimeTo12Hour(time)),
      ),
    );
  }
}
