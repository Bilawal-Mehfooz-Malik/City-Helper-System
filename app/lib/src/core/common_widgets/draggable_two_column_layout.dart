import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app/src/core/utils/theme_extension.dart';

class DraggableTwoColumnLayout extends StatefulWidget {
  const DraggableTwoColumnLayout({
    super.key,
    required this.startContent,
    required this.endContent,
    this.initialStartWidth = 300,
    this.minStartWidth = 220,
    this.maxStartWidth = 500,
    this.dividerHoverHitbox = 4,
    this.dividerThickness = 1,
    this.dividerColor,
    this.hoverColor,
    this.enableHaptics = false,
    this.optimizePainting = true,
  });

  final Widget startContent;
  final Widget endContent;

  final double initialStartWidth;
  final double minStartWidth;
  final double maxStartWidth;

  final double dividerHoverHitbox;
  final double dividerThickness;

  final Color? dividerColor;
  final Color? hoverColor;
  final bool enableHaptics;

  /// Wraps each panel in RepaintBoundary (good for heavy content)
  final bool optimizePainting;

  @override
  State<DraggableTwoColumnLayout> createState() =>
      _DraggableTwoColumnLayoutState();
}

class _DraggableTwoColumnLayoutState extends State<DraggableTwoColumnLayout> {
  late final ValueNotifier<double> widthNotifier;

  @override
  void initState() {
    super.initState();
    widthNotifier = ValueNotifier(widget.initialStartWidth);
  }

  void _handleDrag(double delta) {
    final newWidth = (widthNotifier.value + delta).clamp(
      widget.minStartWidth,
      widget.maxStartWidth,
    );

    widthNotifier.value = newWidth;
  }

  @override
  Widget build(BuildContext context) {
    final dividerClr =
        widget.dividerColor ?? context.colorScheme.outlineVariant;
    final hoverClr = widget.hoverColor ?? context.colorScheme.outlineVariant;

    Widget startPanel = ValueListenableBuilder<double>(
      valueListenable: widthNotifier,
      builder: (_, width, _) =>
          SizedBox(width: width, child: widget.startContent),
    );

    Widget endPanel = Expanded(child: widget.endContent);

    if (widget.optimizePainting) {
      startPanel = RepaintBoundary(child: startPanel);
      endPanel = Expanded(child: RepaintBoundary(child: widget.endContent));
    }

    return Row(
      children: [
        startPanel,

        _DraggableDivider(
          color: dividerClr,
          hoverColor: hoverClr,
          thickness: widget.dividerThickness,
          hitbox: widget.dividerHoverHitbox,
          enableHaptics: widget.enableHaptics,
          onDrag: _handleDrag,
        ),

        endPanel,
      ],
    );
  }
}

class _DraggableDivider extends StatefulWidget {
  const _DraggableDivider({
    required this.color,
    required this.hoverColor,
    required this.thickness,
    required this.hitbox,
    required this.onDrag,
    required this.enableHaptics,
  });

  final Color color;
  final Color hoverColor;
  final double thickness;
  final double hitbox;
  final bool enableHaptics;
  final ValueChanged<double> onDrag;

  @override
  State<_DraggableDivider> createState() => _DraggableDividerState();
}

class _DraggableDividerState extends State<_DraggableDivider> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.resizeColumn,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: Listener(
        onPointerDown: (_) {
          if (widget.enableHaptics) HapticFeedback.selectionClick();
        },
        onPointerMove: (event) {
          widget.onDrag(event.delta.dx);
        },
        child: SizedBox(
          width: widget.hitbox,
          child: Center(
            child: Container(
              width: widget.thickness,
              decoration: BoxDecoration(
                color: widget.color,
                border: _hovering
                    ? Border(
                        left: BorderSide(color: widget.hoverColor, width: 3),
                        right: BorderSide(color: widget.hoverColor, width: 3),
                      )
                    : null,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
