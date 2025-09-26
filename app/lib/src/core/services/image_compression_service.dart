import 'package:app/src/core/exceptions/app_logger.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

part 'image_compression_service.g.dart';

class ImageCompressionService {
  /// Compresses an image file and returns it as an XFile.
  /// Returns null if compression fails.
  Future<XFile?> compressImage(XFile file) async {
    try {
      if (kIsWeb) {
        // Web platform: compress directly from bytes
        final bytes = await file.readAsBytes();
        final compressedBytes = await FlutterImageCompress.compressWithList(
          bytes,
          quality: 95,
          minWidth: 1024,
        );
        if (compressedBytes.isEmpty) {
          AppLogger.logError(
            'Image compression failed on web: result was null or empty.',
          );
          return null;
        }
        // Create a new XFile from the compressed bytes
        return XFile.fromData(
          compressedBytes,
          name: file.name,
          mimeType: file.mimeType,
        );
      } else {
        // Mobile/Desktop platform: use temporary file
        final tempDir = await getTemporaryDirectory();
        final targetPath = p.join(tempDir.path, '${const Uuid().v4()}.jpg');

        final result = await FlutterImageCompress.compressAndGetFile(
          file.path,
          targetPath,
          quality: 95,
          minWidth: 1024,
        );

        if (result == null) {
          AppLogger.logError(
            'Image compression failed on non-web: result was null.',
          );
          return null;
        }
        return XFile(result.path);
      }
    } catch (e, s) {
      AppLogger.logError('Error compressing image', error: e, stackTrace: s);
      return null;
    }
  }
}

@riverpod
ImageCompressionService imageCompressionService(Ref ref) {
  return ImageCompressionService();
}
