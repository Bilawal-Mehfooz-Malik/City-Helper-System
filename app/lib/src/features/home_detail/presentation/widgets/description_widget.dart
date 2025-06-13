import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:flutter/material.dart';

class DescriptionWidget extends StatefulWidget {
  final String text;
  final int collapsedLines;

  const DescriptionWidget({
    super.key,
    required this.text,
    this.collapsedLines = 4,
  });

  @override
  State<DescriptionWidget> createState() => _DescriptionWidgetState();
}

class _DescriptionWidgetState extends State<DescriptionWidget> {
  bool _isExpanded = false;
  bool _isTextLong = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final textPainter = TextPainter(
          text: TextSpan(
            text: widget.text,
            style: DefaultTextStyle.of(context).style,
          ),
          maxLines: widget.collapsedLines,
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: constraints.maxWidth);

        _isTextLong = textPainter.didExceedMaxLines;

        return InkWell(
          onTap: () => setState(() {
            _isExpanded = !_isExpanded;
          }),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.text,
                maxLines: _isExpanded ? null : widget.collapsedLines,
                overflow: _isExpanded
                    ? TextOverflow.visible
                    : TextOverflow.ellipsis,
              ),
              if (_isTextLong) ...[
                gapH4,
                Text(
                  _isExpanded ? context.loc.seeLess : context.loc.seeMore,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: context.colorScheme.primary,
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
