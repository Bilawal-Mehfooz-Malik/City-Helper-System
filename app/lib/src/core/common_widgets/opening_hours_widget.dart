import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/models/opening_hours.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/home_detail/domain/entity_detail.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
    final todayAbbr = DateFormat.E().format(DateTime.now());
    final hours = widget.entity.openingHours;
    final isOpen = widget.entity.isEntityOpen();

    // Find today's index
    final todayIndex = hours.indexWhere(
      (h) => h.day.toLowerCase().startsWith(todayAbbr.toLowerCase()),
    );

    // Get today's hours or fallback
    final todayHours = todayIndex >= 0
        ? hours[todayIndex]
        : OpeningHours(day: '', startTime: context.loc.closed, endTime: '');

    // Reorder list so today is first
    final reorderedHours = todayIndex >= 0
        ? [...hours.sublist(todayIndex), ...hours.sublist(0, todayIndex)]
        : hours;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OpeningStatusHeader(
          labelWidget: OpeningHoursLabel(
            todayHours: todayHours,
            isOpen: isOpen,
          ),
          isOpen: isOpen,
          isExpanded: _isExpanded,
          onTap: () => setState(() => _isExpanded = !_isExpanded),
        ),
        if (_isExpanded) ...[
          gapW4,
          ...reorderedHours.map((hour) {
            final isToday = hour.day.toLowerCase().startsWith(
              todayAbbr.toLowerCase(),
            );
            return OpeningHourRow(hour: hour, isToday: isToday);
          }),
        ],
      ],
    );
  }
}

class OpeningHoursLabel extends StatelessWidget {
  final OpeningHours todayHours;
  final bool isOpen;

  const OpeningHoursLabel({
    super.key,
    required this.todayHours,
    required this.isOpen,
  });

  @override
  Widget build(BuildContext context) {
    final loc = context.loc;
    final colorScheme = context.colorScheme;

    final closedText = loc.closed;
    final openText = loc.open;
    final closesAtText = loc.closes;
    final opensAtText = loc.opensAt;

    final startLower = todayHours.startTime.toLowerCase();
    final isClosed = startLower == closedText.toLowerCase();

    final normalColor = colorScheme.onSurface;
    final openColor = colorScheme.primary;
    final closedColor = colorScheme.error;

    if (isClosed) {
      return _buildColoredText(closedText, closedColor);
    }

    if (isOpen) {
      return RichText(
        text: TextSpan(
          style: TextStyle(color: normalColor),
          children: [
            _coloredSpan(openText, openColor),
            _normalSpan(' • '),
            _normalSpan('$closesAtText ${todayHours.endTime}'),
          ],
        ),
      );
    } else {
      return RichText(
        text: TextSpan(
          style: TextStyle(color: normalColor),
          children: [
            _coloredSpan(closedText, closedColor),
            _normalSpan(' • '),
            _normalSpan('$opensAtText ${todayHours.startTime}'),
          ],
        ),
      );
    }
  }

  TextSpan _coloredSpan(String text, Color color) => TextSpan(
    text: text,
    style: TextStyle(color: color, fontWeight: FontWeight.w600),
  );

  TextSpan _normalSpan(String text) => TextSpan(
    text: text,
    style: const TextStyle(fontWeight: FontWeight.w400),
  );

  Widget _buildColoredText(String text, Color color) => Text(
    text,
    style: TextStyle(color: color, fontWeight: FontWeight.w600),
  );
}

class OpeningStatusHeader extends StatelessWidget {
  final Widget labelWidget;
  final bool isOpen;
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
    final colorScheme = context.colorScheme;
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
            Expanded(
              child: DefaultTextStyle.merge(
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: isOpen ? colorScheme.primary : colorScheme.error,
                ),
                child: labelWidget,
              ),
            ),
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
  final OpeningHours hour;
  final bool isToday;

  const OpeningHourRow({super.key, required this.hour, required this.isToday});

  @override
  Widget build(BuildContext context) {
    final loc = context.loc;
    final colorScheme = context.colorScheme;
    final isClosed = hour.startTime.toLowerCase() == loc.closed.toLowerCase();

    final textStyle = isToday
        ? const TextStyle(fontWeight: FontWeight.bold)
        : const TextStyle();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          SizedBox(width: 90, child: Text(hour.day, style: textStyle)),
          if (isClosed)
            Text(
              loc.closed,
              style: textStyle.copyWith(color: colorScheme.error),
            )
          else
            Text('${hour.startTime} – ${hour.endTime}', style: textStyle),
        ],
      ),
    );
  }
}
