import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_image_controller.freezed.dart';
part 'profile_image_controller.g.dart';

@freezed
abstract class ProfileImageState with _$ProfileImageState {
  const factory ProfileImageState({
    XFile? imageFile,
    @Default(false) bool imageRemoved,
  }) = _ProfileImageState;
}

@Riverpod(keepAlive: false)
class ProfileImageController extends _$ProfileImageController {
  @override
  ProfileImageState build() {
    return const ProfileImageState();
  }

  void setImage(XFile file) {
    state = state.copyWith(imageFile: file, imageRemoved: false);
  }

  void removeImage() {
    state = state.copyWith(imageFile: null, imageRemoved: true);
  }

  void clear() {
    state = const ProfileImageState();
  }
}
