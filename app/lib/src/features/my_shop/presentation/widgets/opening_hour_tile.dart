import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/models/opening_hours.dart';
import 'package:app/src/core/models/time_slot.dart';
import 'package:app/src/core/utils/date_formatter.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';

class OpeningHoursTile extends StatelessWidget {
  final Map<DayOfWeek, OpeningHours> openingHours;
  final ValueChanged<Map<DayOfWeek, OpeningHours>> onOpeningHoursChanged;
  final int categoryId;

  const OpeningHoursTile({
    super.key,
    required this.openingHours,
    required this.onOpeningHoursChanged,
    required this.categoryId,
  });

  @override
  Widget build(BuildContext context) {
    final title = switch (categoryId) {
      1 => 'Office Opening Hours *'.hardcoded,
      2 => 'Opening Hours *'.hardcoded,
      _ => 'Shop Opening Hours *'.hardcoded,
    };

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.p8),
        side: BorderSide(
          color: context.colorScheme.outline.withValues(alpha: 0.5),
          width: 1,
        ),
      ),
      child: InkWell(
        onTap: () => _editOpeningHours(context, title),
        borderRadius: BorderRadius.circular(Sizes.p8),
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: context.textTheme.titleMedium),
                    gapH4,
                    Text(
                      'Set the days and times your business is open'.hardcoded,
                      style: context.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              Icon(Icons.access_time, color: context.colorScheme.primary),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _editOpeningHours(BuildContext context, String title) async {
    final Map<DayOfWeek, OpeningHours> tempHours = Map.from(openingHours);

    await showDialog<void>(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Sizes.p8),
        ),
        elevation: 4,
        child: DefaultTabController(
          length: DayOfWeek.values.length,
          child: Padding(
            padding: const EdgeInsets.all(Sizes.p16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: context.textTheme.titleLarge),
                gapH8,
                Text(
                  "Set your business opening hours for each day".hardcoded,
                  style: context.textTheme.bodyMedium,
                ),
                gapH12,
                TabBar(
                  isScrollable: true,
                  tabs: DayOfWeek.values.map((day) {
                    final dayName =
                        day.name[0].toUpperCase() + day.name.substring(1);
                    return Tab(text: dayName.substring(0, 3)); // e.g., "Mon"
                  }).toList(),
                  labelStyle: context.textTheme.titleMedium,
                  labelColor: context.colorScheme.primary,
                  unselectedLabelColor: context.colorScheme.onSurface,
                  indicatorColor: context.colorScheme.primary,
                ),
                gapH8,
                Expanded(
                  child: TabBarView(
                    children: DayOfWeek.values.map((day) {
                      final dayHours =
                          tempHours[day] ??
                          const OpeningHours(isDayOff: true, slots: null);
                      return SingleChildScrollView(
                        child: OpeningHoursEditor(
                          day: day,
                          dayHours: dayHours,
                          onChanged: (updatedHours) {
                            (context as Element).markNeedsBuild();
                            tempHours[day] = updatedHours;
                          },
                        ),
                      );
                    }).toList(),
                  ),
                ),
                gapH12,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        context.loc.cancel,
                        style: TextStyle(color: context.colorScheme.primary),
                      ),
                    ),
                    gapW8,
                    TextButton(
                      onPressed: () {
                        onOpeningHoursChanged(tempHours);
                        Navigator.pop(context);
                      },
                      child: Text(
                        context.loc.done,
                        style: TextStyle(color: context.colorScheme.primary),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
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
                        slots: null,
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
                              slots: null,
                            ),
                          );
                        },
                ),
              ),
            ],
          ),
          if (!dayHours.isDayOff && !(dayHours.is24Hours)) ...[
            ...(dayHours.slots ?? []).asMap().entries.map((entry) {
              final index = entry.key;
              final slot = entry.value;
              return TimeSlotEditor(
                slot: slot,
                onChanged: (updatedSlot) {
                  final newSlots = List<TimeSlot>.from(dayHours.slots ?? []);
                  newSlots[index] = updatedSlot;
                  onChanged(dayHours.copyWith(slots: newSlots));
                },
                onDelete: () {
                  final newSlots = List<TimeSlot>.from(dayHours.slots ?? []);
                  newSlots.removeAt(index);
                  onChanged(dayHours.copyWith(slots: newSlots));
                },
              );
            }),
            gapH4,
            TextButton.icon(
              onPressed: () {
                final newSlots = List<TimeSlot>.from(dayHours.slots ?? []);
                newSlots.add(const TimeSlot(open: '09:00', close: '17:00'));
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
