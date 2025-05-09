import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'list_type_controller.g.dart';

enum HomeListType { popular, all }

@Riverpod(keepAlive: true)
class ListTypeController extends _$ListTypeController {
  @override
  HomeListType build() {
    return HomeListType.all;
  }

  void updateListType(HomeListType listType) {
    state = listType;
  }
}
