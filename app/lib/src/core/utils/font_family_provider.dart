import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/src/localization/string_hardcoded.dart';

final primaryFontFamilyProvider = Provider((ref) => 'Inter'.hardcoded);
final secondaryFontFamilyProvider = Provider((ref) => 'Mulish'.hardcoded);
final tertiaryFontFamilyProvider = Provider((ref) => 'Noto Sans'.hardcoded);
