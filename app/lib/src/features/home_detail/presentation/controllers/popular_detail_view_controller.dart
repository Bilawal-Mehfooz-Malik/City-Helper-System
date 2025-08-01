import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'popular_detail_view_controller.g.dart';

@Riverpod(keepAlive: true)
class PopularDetailViewController extends _$PopularDetailViewController {
  @override
  bool build() {
    return false;
  }

  void setPopularView(bool value) {
    state = value;
  }
}
