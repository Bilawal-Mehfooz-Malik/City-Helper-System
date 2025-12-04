import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/pick_location/presentation/controllers/fab_menu_controller.dart';
import 'package:app/src/features/pick_location/presentation/controllers/map_type_controller.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FabMenu extends ConsumerStatefulWidget {
  final MapType mapType;

  const FabMenu({super.key, required this.mapType});

  @override
  ConsumerState<FabMenu> createState() => _TextFabMenuState();
}

class _TextFabMenuState extends ConsumerState<FabMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  final items = <MapType, String>{
    MapType.normal: 'Normal'.hardcoded,
    MapType.satellite: 'Satellite'.hardcoded,
    MapType.terrain: 'Terrain'.hardcoded,
    MapType.hybrid: 'Hybrid'.hardcoded,
  };

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  void _handleToggle(bool open) {
    if (open) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  void _onTapFabItem(MapType type) {
    ref.read(mapTypeControllerProvider.notifier).type = type;
    ref.read(fabMenuControllerProvider.notifier).toggle();
  }

  @override
  Widget build(BuildContext context) {
    final mapType = ref.watch(mapTypeControllerProvider);
    final isOpen = ref.watch(fabMenuControllerProvider);
    ref.listen(fabMenuControllerProvider, (_, next) => _handleToggle(next));

    return Column(
      crossAxisAlignment: .end,
      mainAxisSize: .min,
      children: [
        ClipRect(
          child: Align(
            alignment: .topRight,
            heightFactor: isOpen ? 1 : 0,
            child: Column(
              mainAxisSize: .min,
              crossAxisAlignment: .end,
              spacing: Sizes.p8,
              children: [
                ...items.entries.map((entry) {
                  return _FabMenuItem(
                    entry: entry,
                    isSelected: mapType == entry.key,
                    onTap: () => _onTapFabItem(entry.key),
                  );
                }),
                gapH8,
              ],
            ),
          ),
        ),
        FloatingActionButton(
          heroTag: 'mainMapFab',
          elevation: 2,
          onPressed: () =>
              ref.read(fabMenuControllerProvider.notifier).toggle(),
          child: Icon(isOpen ? Icons.close : Icons.map),
        ),
      ],
    );
  }
}

class _FabMenuItem extends StatelessWidget {
  const _FabMenuItem({
    required this.onTap,
    required this.isSelected,
    required this.entry,
  });

  final VoidCallback onTap;
  final bool isSelected;
  final MapEntry<MapType, String> entry;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const .symmetric(horizontal: Sizes.p12, vertical: Sizes.p12),
        decoration: BoxDecoration(
          color: isSelected
              ? context.colorScheme.primary
              : context.colorScheme.surface,
          borderRadius: .circular(Sizes.p12),
          boxShadow: kElevationToShadow[2],
        ),
        child: Text(
          entry.value,
          style: TextStyle(
            color: isSelected
                ? context.colorScheme.onPrimary
                : context.colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
