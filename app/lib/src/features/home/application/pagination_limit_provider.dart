import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pagination_limit_provider.g.dart';

@Riverpod(keepAlive: true)
int initialLoadLimit(Ref ref) {
  return 8;
}

@Riverpod(keepAlive: true)
int subsequentLoadLimit(Ref ref) {
  return 4;
}
