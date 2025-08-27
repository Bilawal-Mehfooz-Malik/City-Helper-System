import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/models/opening_hours.dart';
import 'package:app/src/core/utils/date_formatter.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/home_detail/domain/entity_detail.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/opening_hours_checker.dart'; // New import

class OpeningHoursWidget extends StatefulWidget {
  final EntityDetail entity;

  const OpeningHoursWidget({super.key, required this.entity});

  @override
  State<OpeningHoursWidget> createState() => _OpeningHoursWidgetState();
}

class _OpeningHoursWidgetState extends State<OpeningHoursWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final hoursMap = widget.entity.openingHours;

    // If there are no opening hours, hide the widget entirely.
    if (hoursMap == null) {
      return const SizedBox.shrink();
    }

    final now = DateTime.now();
    final today = DayOfWeek.values[now.weekday % 7]; // sunday is 0

    final todayHours =
        hoursMap[today] ?? const OpeningHours(isDayOff: true, slots: null);

    // Calculate isOpen dynamically based on entityStatus
    bool? calculatedIsOpen;
    if (widget.entity.entityStatus == OperationalStatus.open) {
      calculatedIsOpen = true;
    } else if (widget.entity.entityStatus == OperationalStatus.close) {
      calculatedIsOpen = false;
    } else {
      // OperationalStatus.defaultStatus
      calculatedIsOpen = OpeningHoursChecker.isOpenNow(hoursMap);
    }

    // Create a list of days starting from today for display order
    final displayDays = DayOfWeek.values.toList();
    final todayIndex = displayDays.indexOf(today);
    final reorderedDays = [
      ...displayDays.sublist(todayIndex),
      ...displayDays.sublist(0, todayIndex),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OpeningStatusHeader(
          labelWidget: OpeningHoursLabel(
            entity: widget.entity, // Pass the entity
            todayHours: todayHours,
            isOpen: calculatedIsOpen, // Pass calculated isOpen
          ),
          isOpen: calculatedIsOpen, // Pass calculated isOpen
          isExpanded: _isExpanded,
          onTap: () => setState(() => _isExpanded = !_isExpanded),
        ),
        if (_isExpanded) ...[
          gapW4,
          ...reorderedDays.map((day) {
            final hourData =
                hoursMap[day] ?? const OpeningHours(isDayOff: true, slots: []);
            return OpeningHourRow(
              day: day,
              hour: hourData,
              isToday: day == today,
            );
          }),
        ],
      ],
    );
  }
}

class OpeningHoursLabel extends StatelessWidget {
  final EntityDetail entity; // New parameter
  final OpeningHours todayHours;
  final bool? isOpen;

  const OpeningHoursLabel({
    super.key,
    required this.entity, // Required new parameter
    required this.todayHours,
    required this.isOpen,
  });

  @override
  Widget build(BuildContext context) {
    final loc = context.loc;
    final colorScheme = context.colorScheme;

    final normalColor = colorScheme.onSurface;
    final openColor = colorScheme.primary;
    final closedColor = colorScheme.error;

    // Determine if it's a Food or Residence entity
    final isFood = entity is FoodDetail;

    // Handle explicit operational status overrides
    if (entity.entityStatus == OperationalStatus.open) {
      final openText = isFood ? loc.open : loc.officeOpen; // Changed for Residence
      return RichText(
        text: TextSpan(
          style: TextStyle(color: normalColor),
          children: [
            TextSpan(
              text: openText,
              style: TextStyle(color: openColor, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      );
    } else if (entity.entityStatus == OperationalStatus.close) {
      final closedText = isFood ? loc.closed : loc.officeClosed; // Changed for Residence
      return RichText(
        text: TextSpan(
          style: TextStyle(color: normalColor),
          children: [
            TextSpan(
              text: closedText,
              style: TextStyle(color: closedColor, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      );
    }

    // Handle defaultStatus (calculated open/closed)
    if (todayHours.isDayOff ||
        todayHours.slots == null ||
        todayHours.slots!.isEmpty) {
      final closedText = isFood ? loc.closed : loc.officeClosed;
      return Text(
        closedText,
        style: TextStyle(color: closedColor, fontWeight: FontWeight.w600),
      );
    }

    final nextSlot = todayHours.slots!.first;

    if (isOpen == true) {
      final openText = isFood ? loc.open : loc.officeOpen;
      return RichText(
        text: TextSpan(
          style: TextStyle(color: normalColor),
          children: [
            TextSpan(
              text: openText,
              style: TextStyle(color: openColor, fontWeight: FontWeight.w600),
            ),
            const TextSpan(
              text: ' • ',
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
            TextSpan(
              text: '${loc.closes} ${formatTimeTo12Hour(nextSlot.close)}',
              style: const TextStyle(fontWeight: FontWeight.w400),
            ),
          ],
        ),
      );
    } else if (isOpen == false) {
      final closedText = isFood ? loc.closed : loc.officeClosed;
      return RichText(
        text: TextSpan(
          style: TextStyle(color: normalColor),
          children: [
            TextSpan(
              text: closedText,
              style: TextStyle(color: closedColor, fontWeight: FontWeight.w600),
            ),
            const TextSpan(
              text: ' • ',
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
            TextSpan(
              text: '${loc.opensAt} ${formatTimeTo12Hour(nextSlot.open)}',
              style: const TextStyle(fontWeight: FontWeight.w400),
            ),
          ],
        ),
      );
    } else {
      // This case should ideally not be reached if calculatedIsOpen is always true/false
      // but as a fallback, show closed.
      final closedText = isFood ? loc.closed : loc.officeClosed;
      return Text(
        closedText,
        style: TextStyle(color: closedColor, fontWeight: FontWeight.w600),
      );
    }
  }
}

class OpeningStatusHeader extends StatelessWidget {
  final Widget labelWidget;
  final bool? isOpen;
  final bool isExpanded;
  final VoidCallback onTap;

  const OpeningStatusHeader({
    super.key,
    required this.labelWidget,
    required this.isOpen,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(Sizes.p8),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.p8,
          horizontal: Sizes.p4,
        ),
        child: Row(
          children: [
            const Icon(Icons.access_time, size: 20),
            gapW8,
            Expanded(child: labelWidget),
            Icon(
              isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            ),
          ],
        ),
      ),
    );
  }
}

class OpeningHourRow extends StatelessWidget {
  final DayOfWeek day;
  final OpeningHours hour;
  final bool isToday;

  const OpeningHourRow({
    super.key,
    required this.day,
    required this.hour,
    required this.isToday,
  });

  @override
  Widget build(BuildContext context) {
    final loc = context.loc;
    final colorScheme = context.colorScheme;
    final textStyle = isToday
        ? const TextStyle(fontWeight: FontWeight.bold)
        : const TextStyle();
    final dayName = day.name[0].toUpperCase() + day.name.substring(1);

    String hoursText;
    TextStyle hoursTextStyle = textStyle;

    if (hour.isDayOff || hour.slots == null || hour.slots!.isEmpty) {
      hoursText = loc.closed;
      hoursTextStyle = textStyle.copyWith(color: colorScheme.error);
    } else if (hour.is24Hours) {
      hoursText = loc.open24Hours;
      hoursTextStyle = textStyle.copyWith(color: colorScheme.primary);
    } else {
      hoursText = hour.slots!
          .map(
            (slot) =>
                '${formatTimeTo12Hour(slot.open)} – ${formatTimeTo12Hour(slot.close)}',
          )
          .join(', ');
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          SizedBox(width: 90, child: Text(dayName, style: textStyle)),
          Text(hoursText, style: hoursTextStyle),
        ],
      ),
    );
  }
}
