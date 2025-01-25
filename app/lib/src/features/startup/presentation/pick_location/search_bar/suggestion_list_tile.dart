import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/startup/domain/place_dto.dart';
import 'package:flutter/material.dart';

class SuggestionListTile extends StatelessWidget {
  const SuggestionListTile({
    super.key,
    required this.place,
    required this.onTap,
  });

  final PlaceSuggestion place;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        height: 40,
        width: 40,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: context.colorScheme.surface,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Icon(Icons.location_on_outlined),
        ),
      ),
      title: Text(place.name),
      subtitle: place.streetAddress != null ? Text(place.streetAddress!) : null,
      onTap: onTap,
    );
  }
}
