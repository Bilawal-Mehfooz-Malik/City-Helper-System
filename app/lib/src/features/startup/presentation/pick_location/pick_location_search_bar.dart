import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';

class PickLocationSearchBar extends StatefulWidget {
  const PickLocationSearchBar({super.key});

  @override
  State<PickLocationSearchBar> createState() => PickLocationSearchBarState();
}

class PickLocationSearchBarState extends State<PickLocationSearchBar> {
  bool _showClearButton = false;
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // show clear button when text in search bar is not empty
    _searchController.addListener(() {
      setState(() => _showClearButton = _searchController.text.isNotEmpty);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      // enabled: false,
      controller: _searchController,
      trailing: _showClearButton
          ? [
              IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () => _searchController.clear(),
              ),
            ]
          : null,
      hintText: 'Search Location'.hardcoded,
      leading: BackButton(color: context.colorScheme.inversePrimary),
    );
  }
}
