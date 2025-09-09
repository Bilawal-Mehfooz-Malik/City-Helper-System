import 'package:app/src/core/services/image_compression_service.dart';
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

  Future<void> setImage(XFile file) async {
    final compressionService = ref.read(imageCompressionServiceProvider);
    final compressedFile = await compressionService.compressImage(file);
    if (compressedFile != null) {
      state = state.copyWith(imageFile: compressedFile, imageRemoved: false);
    }
    // Optional: handle else case where compression fails, e.g., show a message.
  }

  void removeImage() {
    state = state.copyWith(imageFile: null, imageRemoved: true);
  }

  void clear() {
    state = const ProfileImageState();
  }
}