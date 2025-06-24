import 'package:app/src/core/common_widgets/custom_image.dart';
import 'package:app/src/core/common_widgets/custom_outlined_button.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImageWidget extends StatefulWidget {
  final String? initialImageUrl;
  final XFile? initialImageFile;
  final bool isLoading;
  final void Function(XFile? pickedFile)? onImageChanged;
  final void Function()? onImageRemoved;

  const ProfileImageWidget({
    super.key,
    this.initialImageUrl,
    this.initialImageFile,
    this.isLoading = false,
    this.onImageChanged,
    this.onImageRemoved,
  });

  @override
  State<ProfileImageWidget> createState() => _ProfileImageWidgetState();
}

class _ProfileImageWidgetState extends State<ProfileImageWidget> {
  late XFile? _pickedFile;
  late String? _imageUrl;
  final ImagePicker _picker = ImagePicker();
  bool _imageRemoved = false;

  @override
  void initState() {
    super.initState();
    _pickedFile = widget.initialImageFile;
    _imageUrl = widget.initialImageUrl;
  }

  Future<void> _pickImage() async {
    if (widget.isLoading) return;
    final picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked != null && mounted) {
      setState(() {
        _pickedFile = picked;
        _imageRemoved = false;
        _imageUrl = null;
      });
      widget.onImageChanged?.call(picked);
    }
  }

  void _removeImage() {
    if (widget.isLoading) return;
    setState(() {
      _pickedFile = null;
      _imageRemoved = true;
      _imageUrl = null;
    });
    widget.onImageRemoved?.call();
    widget.onImageChanged?.call(null);
  }

  @override
  Widget build(BuildContext context) {
    final showImage =
        !_imageRemoved &&
        (_pickedFile != null || (_imageUrl?.isNotEmpty ?? false));
    return Column(
      children: [
        SizedBox(
          width: 96,
          height: 96,
          child: ClipOval(
            child: CustomImage(
              imageXFile: _pickedFile,
              imageUrl: _pickedFile == null ? _imageUrl : null,
              useAspectRatio: false,
              fit: BoxFit.cover,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
        gapH16,
        Wrap(
          spacing: Sizes.p8,
          runSpacing: Sizes.p4,
          children: [
            CustomOutlinedButton(
              onPressed: _pickImage,
              isDisabled: widget.isLoading,
              text: context.loc.profile_uploadPhoto,
            ),
            CustomOutlinedButton(
              onPressed: _removeImage,
              isDisabled: widget.isLoading || !showImage,
              text: context.loc.profile_removePhoto,
            ),
          ],
        ),
      ],
    );
  }
}
