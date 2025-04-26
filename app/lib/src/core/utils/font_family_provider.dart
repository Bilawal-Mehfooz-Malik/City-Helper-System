import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../localization/string_hardcoded.dart';

part 'font_family_provider.g.dart';

@riverpod
String fontFamily(Ref ref) {
  // inter
  return 'Roboto'.hardcoded;
}
