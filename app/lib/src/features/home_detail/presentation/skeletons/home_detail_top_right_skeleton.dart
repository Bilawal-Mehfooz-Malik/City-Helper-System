import 'package:app/src/core/common_widgets/custom_text_button.dart';
import 'package:app/src/core/common_widgets/primary_button.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/home_detail/presentation/widgets/primary_contact_button.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeDetailTopRightSkeleton extends StatelessWidget {
  const HomeDetailTopRightSkeleton({super.key, required this.isSmall});

  final bool isSmall;

  @override
  Widget build(BuildContext context) {
    return isSmall
        ? _RightSectionContent(isSmall: isSmall)
        : Card(
            margin: EdgeInsets.zero,
            child: _RightSectionContent(isSmall: isSmall),
          );
  }
}

class _RightSectionContent extends StatelessWidget {
  const _RightSectionContent({required this.isSmall});
  final bool isSmall;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Sizes.p16,
        bottom: Sizes.p16,
        left: !isSmall ? Sizes.p16 : 0,
        right: !isSmall ? Sizes.p16 : 0,
      ),
      child: Column(
        spacing: Sizes.p4,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _LocationRowSkeleton(),
          const Divider(),
          const _RatingRowSkeleton(),
          const Divider(),
          const _FurnishedRowSkeleton(),
          const Divider(),
          const _DetailRowSkeleton(),
          const Divider(),
          Bone.text(words: 2),
          gapH4,
          const _ContactButtonsSkeleton(),
        ],
      ),
    );
  }
}

class _LocationRowSkeleton extends StatelessWidget {
  const _LocationRowSkeleton();

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: Sizes.p4,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Bone.icon(size: 20),
        const Expanded(child: Bone.text(words: 5)),
        PrimaryButton(text: BoneMock.name),
      ],
    );
  }
}

class _RatingRowSkeleton extends StatelessWidget {
  const _RatingRowSkeleton();

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: Sizes.p8,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Wrap(
            spacing: Sizes.p4,
            runSpacing: Sizes.p4,
            children: [Bone.icon(size: 20), Bone.text(words: 2)],
          ),
        ),
        Flexible(child: CustomTextButton(text: BoneMock.words(2))),
      ],
    );
  }
}

class _FurnishedRowSkeleton extends StatelessWidget {
  const _FurnishedRowSkeleton();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Bone.text(words: 1), Bone.text(words: 1)],
    );
  }
}

class _DetailRowSkeleton extends StatelessWidget {
  const _DetailRowSkeleton();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.p8,
        horizontal: Sizes.p4,
      ),
      child: Row(
        children: [
          Bone.icon(size: 20),
          gapW8,
          const Expanded(child: Bone.text(words: 3)),
          Bone.icon(),
        ],
      ),
    );
  }
}

class _ContactButtonsSkeleton extends StatelessWidget {
  const _ContactButtonsSkeleton();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: Sizes.p8,
      runSpacing: Sizes.p8,
      children: [
        DetailContactButton(
          icon: Icons.phone,
          color: context.colorScheme.primary,
          label: context.loc.call,
          onPressed: () {},
        ),
        DetailContactButton(
          icon: Icons.chat,
          color: context.colorScheme.primary,
          label: context.loc.message,
          onPressed: () {},
        ),
      ],
    );
  }
}
