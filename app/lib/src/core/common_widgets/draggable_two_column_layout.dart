import 'package:app/src/core/constants/breakpoints.dart';
import 'package:flutter/material.dart';

class DraggableTwoColumnLayout extends StatefulWidget {
  const DraggableTwoColumnLayout({
    super.key,
    required this.startContent,
    required this.endContent,
    this.initialStartWidth = 300,
    this.minStartWidth = 200,
    this.maxStartWidth = 500,
    this.breakpoint = Breakpoint.tablet,
  });

  final Widget startContent;
  final Widget endContent;
  final double initialStartWidth;
  final double minStartWidth;
  final double maxStartWidth;
  final double breakpoint;

  @override
  State<DraggableTwoColumnLayout> createState() =>
      _DraggableTwoColumnLayoutState();
}

class _DraggableTwoColumnLayoutState extends State<DraggableTwoColumnLayout> {
  late double startWidth;

  @override
  void initState() {
    super.initState();
    startWidth = widget.initialStartWidth;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: startWidth.clamp(widget.minStartWidth, widget.maxStartWidth),
          child: widget.startContent,
        ),
        MouseRegion(
          cursor: SystemMouseCursors.resizeLeftRight,
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onHorizontalDragUpdate: (details) {
              setState(() {
                startWidth += details.delta.dx;
              });
            },
            child: VerticalDivider(),
          ),
        ),
        Expanded(child: widget.endContent),
      ],
    );
  }
}
