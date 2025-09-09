import 'package:image_picker/image_picker.dart';

/// A sealed class to represent an image that can either be a new file
/// or an existing network URL. This is used to differentiate how to
/// display and process images in the UI and business logic.
sealed class ImageHolder {}

/// Represents an existing image, loaded from a network URL.
class ImageUrl extends ImageHolder {
  final String url;
  ImageUrl(this.url);
}

/// Represents a new image, picked from the local device.
class ImageFile extends ImageHolder {
  final XFile file;
  ImageFile(this.file);
}
