import 'package:app/src/core/common_widgets/alert_dialogs.dart';
import 'package:app/src/core/common_widgets/custom_text_button.dart';
import 'package:app/src/core/common_widgets/opening_hours_widget.dart';
import 'package:app/src/core/common_widgets/primary_button.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/constants/breakpoints.dart';
import 'package:app/src/core/utils/currency_formatter.dart';
import 'package:app/src/core/utils/url_launcher_helpers.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/auth/data/auth_repository.dart';
import 'package:app/src/features/home_detail/domain/entity_detail.dart';
import 'package:app/src/features/home_detail/domain/residence_detail.dart';
import 'package:app/src/features/review/presentation/leave_review_screen.dart';
import 'package:app/src/features/home_detail/presentation/widgets/outlined_contact_button.dart';
import 'package:app/src/features/home_detail/presentation/widgets/primary_contact_button.dart';
import 'package:app/src/features/review/data/reviews_repository.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:app/src/routers/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class HomeDetailTopRightSection extends StatelessWidget {
  final EntityDetail entity;
  const HomeDetailTopRightSection({super.key, required this.entity});

  bool _isSmallScreen(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final screenType = ScreenType.determine(
      width: size.width,
      height: size.height,
    );
    return screenType == ScreenType.smallHeight ||
        screenType == ScreenType.mobile;
  }

  @override
  Widget build(BuildContext context) {
    final isSmall = _isSmallScreen(context);

    return isSmall
        ? HomeDetailTopRightContent(entity: entity, isSmall: isSmall)
        : Card(
            margin: EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
              child: HomeDetailTopRightContent(
                entity: entity,
                isSmall: isSmall,
              ),
            ),
          );
  }
}

class HomeDetailTopRightContent extends ConsumerWidget {
  const HomeDetailTopRightContent({
    super.key,
    required this.entity,
    required this.isSmall,
  });

  final EntityDetail entity;
  final bool isSmall;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isResidence = entity is ResidenceDetail;
    final residence = isResidence ? entity as ResidenceDetail : null;
    final formattedPrice = residence != null
        ? ref.watch(currencyFormatterProvider).format(residence.price)
        : null;

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: Sizes.p40, bottom: Sizes.p16),
          child: Column(
            spacing: Sizes.p4,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (formattedPrice != null) ...[
                Text(
                  '${context.loc.startsFrom} $formattedPrice',
                  style: context.textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                gapH4,
              ],

              LocationRow(entity: entity),
              Divider(),
              _RatingRow(entity: entity, isSmall: isSmall),
              if (residence != null) ...[
                Divider(),
                FurnishedInfo(residence: residence),
                Divider(),
              ],
              OpeningHoursWidget(entity: entity),
              if (entity.instagramUrl != null ||
                  entity.facebookUrl != null ||
                  entity.messagingNumber != null ||
                  entity.phoneNumber != null ||
                  entity.email != null ||
                  entity.websiteUrl != null) ...[
                Divider(),
                Text(
                  context.loc.contactOptions,
                  style: context.textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                gapH4,
                ContactOptionsRow(entity: entity),
              ],
            ],
          ),
        ),
        Positioned(
          right: Sizes.p4,
          top: Sizes.p4,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.p16,
              vertical: Sizes.p4,
            ),
            decoration: BoxDecoration(
              color: Colors.amber.shade300,
              borderRadius: BorderRadius.circular(Sizes.p16),
            ),
            child: Text(context.loc.popular),
          ),
        ),
      ],
    );
  }
}

class _RatingRow extends ConsumerWidget {
  const _RatingRow({required this.entity, required this.isSmall});

  final bool isSmall;
  final EntityDetail entity;

  void _goToLoginScreen(BuildContext context) {
    Navigator.of(context).pop();
    context.pushNamed(AppRoute.auth.name);
  }

  void _goToWriteReviewScreen(BuildContext context) {
    if (isSmall) {
      context.goNamed(
        AppRoute.leaveReview.name,
        pathParameters: {
          'categoryId': entity.categoryId.toString(),
          'entityId': entity.id,
        },
      );
    } else {
      showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: context.loc.leaveAREview,
        pageBuilder: (_, __, ___) {
          return Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.45,
              height: double.infinity,
              child: LeaveReviewScreen(
                entityId: entity.id,
                categoryId: entity.categoryId,
              ),
            ),
          );
        },
      );
    }
  }

  void _checkIsUserLoggedIn(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStateChangesProvider).value;
    if (user == null) {
      showAlertDialog(
        context: context,
        useFilledButton: true,
        title: context.loc.loginRequired,
        content: context.loc.loginRequiredContent,
        cancelActionText: context.loc.cancel,
        defaultActionText: context.loc.logIn,
        defaultAction: () => _goToLoginScreen(context),
      );
    } else {
      _goToWriteReviewScreen(context);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userReviewAsync = ref.watch(userReviewFutureProvider(entity.id));

    final buttonText = userReviewAsync.maybeWhen(
      data: (review) =>
          review != null ? context.loc.updateAReview : context.loc.writeAReview,
      orElse: () => context.loc.writeAReview,
    );

    return Row(
      spacing: Sizes.p8,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Wrap(
            spacing: Sizes.p4,
            runSpacing: Sizes.p4,
            children: [
              Icon(Icons.star, color: Colors.amber, size: 20),
              Text(entity.avgRating.toStringAsFixed(1)),
              Text('(${entity.totalReviews} ${context.loc.reviews})'.hardcoded),
            ],
          ),
        ),
        Flexible(
          child: CustomTextButton(
            text: buttonText,
            onPressed: () => _checkIsUserLoggedIn(context, ref),
          ),
        ),
      ],
    );
  }
}

class LocationRow extends StatelessWidget {
  final EntityDetail entity;

  const LocationRow({required this.entity, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: Sizes.p4,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(Icons.location_on, size: 20),
        Expanded(
          child: Text(
            '${entity.streetAddress}, ${context.loc.sector} ${entity.sectorName}, ${entity.cityName}',
            style: context.textTheme.bodyMedium,
          ),
        ),
        PrimaryButton(
          onPressed: () => launchGoogleMaps(entity.latLng, context),
          text: context.loc.locateONMap,
        ),
      ],
    );
  }
}

class FurnishedInfo extends StatelessWidget {
  final ResidenceDetail residence;

  const FurnishedInfo({required this.residence, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          context.loc.furnished,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        Text(residence.isFurnished ? context.loc.yes : context.loc.no),
      ],
    );
  }
}

class ContactOptionsRow extends StatelessWidget {
  final EntityDetail entity;
  const ContactOptionsRow({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: Sizes.p8,
      runSpacing: Sizes.p8,
      children: [
        if (entity.phoneNumber != null)
          DetailContactButton(
            icon: Icons.phone,
            color: context.colorScheme.primary,
            label: context.loc.call,
            onPressed: () => launchPhone(entity.phoneNumber!, context),
          ),
        if (entity.messagingNumber != null)
          DetailContactButton(
            icon: Icons.chat,
            color: context.colorScheme.primary,
            label: context.loc.message,
            onPressed: () => launchSms(entity.messagingNumber!, context),
          ),
        if (entity.facebookUrl != null)
          OutlinedContactButton(
            icon: FontAwesomeIcons.facebookF,
            label: context.loc.facebook,
            onPressed: () => launchWebUrl(entity.facebookUrl!, context),
          ),
        if (entity.instagramUrl != null)
          OutlinedContactButton(
            icon: FontAwesomeIcons.instagram,
            label: context.loc.instagram,
            onPressed: () => launchWebUrl(entity.instagramUrl!, context),
          ),
        if (entity.websiteUrl != null)
          OutlinedContactButton(
            icon: Icons.language,
            label: context.loc.website,
            onPressed: () => launchWebUrl(entity.websiteUrl!, context),
          ),
        if (entity.email != null)
          OutlinedContactButton(
            icon: Icons.email,
            label: context.loc.email,
            onPressed: () => launchEmail(entity.email!, context),
          ),
      ],
    );
  }
}
