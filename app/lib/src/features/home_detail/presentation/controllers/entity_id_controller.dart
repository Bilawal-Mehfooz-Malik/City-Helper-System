import 'package:app/src/core/models/my_data_types.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'entity_id_controller.g.dart';

@riverpod
class EntityIdController extends _$EntityIdController {
  @override
  EntityId? build() {
    return null;
  }

  void updateEntityId(EntityId id) {
    state = id;
  }
}
