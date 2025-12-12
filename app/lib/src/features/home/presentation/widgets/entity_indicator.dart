import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:app/src/features/home/domain/entity.dart';
import 'package:app/src/core/utils/opening_hours_checker.dart';

class EntityStatusIndicator extends StatelessWidget {
  const EntityStatusIndicator({super.key, required this.entity});

  final Entity entity;

  @override
  Widget build(BuildContext context) {
    if (entity is Food) {
      final food = entity as Food;
      switch (food.operationalStatus) {
        case .open:
          return const OpenIndicator();
        case .close:
          return const CloseIndicator();
        case .defaultStatus:
          final bool calculatedIsOpen = OpeningHoursChecker.isOpenNow(
            food.openingHours,
          );
          if (calculatedIsOpen) {
            return const OpenIndicator();
          } else {
            return const CloseIndicator();
          }
      }
    } else if (entity is Residence) {
      final residence = entity as Residence;
      if (residence.isRoomAvailable == true) return const AvailableIndicator();
      if (residence.isRoomAvailable == false) {
        return const UnavailableIndicator();
      }
    }
    return const SizedBox.shrink(); // no indicator fallback
  }
}

class OpenIndicator extends StatelessWidget {
  const OpenIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .symmetric(vertical: Sizes.p4, horizontal: Sizes.p8),
      decoration: BoxDecoration(
        color: context.colorScheme.onPrimary,
        borderRadius: .circular(Sizes.p4),
      ),
      child: Row(
        spacing: Sizes.p4,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: .center,
        mainAxisAlignment: .center,
        children: [
          Flexible(
            child: Icon(
              Icons.circle,
              color: context.colorScheme.primary,
              size: 12,
            ),
          ),
          Flexible(
            child: Text(
              context.loc.open,
              style: context.textTheme.labelMedium?.copyWith(
                fontWeight: .w600,
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CloseIndicator extends StatelessWidget {
  final bool allBorders;
  const CloseIndicator({super.key, this.allBorders = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .symmetric(vertical: Sizes.p4, horizontal: Sizes.p8),
      decoration: BoxDecoration(
        color: context.colorScheme.onPrimary,
        borderRadius: .circular(Sizes.p4),
      ),
      child: Row(
        spacing: Sizes.p4,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Icon(
              Icons.circle,
              color: context.colorScheme.error,
              size: 12,
            ),
          ),
          Flexible(
            child: Text(
              context.loc.close,
              style: context.textTheme.labelMedium?.copyWith(
                fontWeight: .w600,
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AvailableIndicator extends StatelessWidget {
  const AvailableIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: Sizes.p4, horizontal: Sizes.p8),
      decoration: BoxDecoration(
        color: context.colorScheme.onPrimary,
        borderRadius: .circular(Sizes.p4),
      ),
      child: Row(
        spacing: Sizes.p4,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Icon(
              Icons.circle,
              color: context.colorScheme.primary, // Green for available
              size: 14,
            ),
          ),
          Flexible(
            child: Text(
              context.loc.available,
              style: context.textTheme.labelMedium?.copyWith(
                fontWeight: .w600,
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UnavailableIndicator extends StatelessWidget {
  const UnavailableIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: Sizes.p4, horizontal: Sizes.p8),
      decoration: BoxDecoration(
        color: context.colorScheme.onPrimary,
        borderRadius: .circular(Sizes.p4),
      ),
      child: Row(
        spacing: Sizes.p4,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Icon(
              Icons.circle,
              color: context.colorScheme.error, // Red for unavailable
              size: 14,
            ),
          ),
          Flexible(
            child: Text(
              context.loc.unavailable,
              style: context.textTheme.labelMedium?.copyWith(
                fontWeight: .w600,
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
