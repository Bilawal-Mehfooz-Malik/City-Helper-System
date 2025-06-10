import 'package:app/src/core/common_widgets/custom_text_button.dart';
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

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.text,
              maxLines: _isExpanded ? null : widget.collapsedLines,
              overflow: _isExpanded
                  ? TextOverflow.visible
                  : TextOverflow.ellipsis,
            ),
            if (_isTextLong)
              Align(
                alignment: Alignment.centerRight,
                child: CustomTextButton(
                  text: _isExpanded ? context.loc.seeLess : context.loc.seeMore,
                  onPressed: () => setState(() {
                    _isExpanded = !_isExpanded;
                  }),
                ),
              ),
          ],
        );
      },
    );
  }
}
