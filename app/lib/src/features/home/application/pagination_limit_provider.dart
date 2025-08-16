import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pagination_limit_provider.g.dart';

@riverpod
int popularEntitiesLimit(Ref ref) {
  return 5;
}
