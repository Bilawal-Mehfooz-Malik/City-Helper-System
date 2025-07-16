import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';

class BasicInfoSection extends StatelessWidget {
  // Values are passed in
  final String name;
  final String description;
  final String phone;
  final String messagingNumber;
  final String city;
  final String sector;
  final String street;
  final String email;
  // Callbacks to notify the controller of changes
  final ValueChanged<String> onNameChanged;
  final ValueChanged<String> onDescriptionChanged;
  final ValueChanged<String> onPhoneChanged;
  final ValueChanged<String> onMessagingNumberChanged;
  final ValueChanged<String> onCityChanged;
  final ValueChanged<String> onSectorChanged;
  final ValueChanged<String> onStreetChanged;
  final ValueChanged<String> onEmailChanged;

  const BasicInfoSection({
    super.key,
    required this.name,
    required this.description,
    required this.phone,
    required this.messagingNumber,
    required this.city,
    required this.sector,
    required this.street,
    required this.email,
    required this.onNameChanged,
    required this.onDescriptionChanged,
    required this.onPhoneChanged,
    required this.onMessagingNumberChanged,
    required this.onCityChanged,
    required this.onSectorChanged,
    required this.onStreetChanged,
    required this.onEmailChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Shop Name *'.hardcoded, style: context.textTheme.titleMedium),
        gapH4,
        TextFormField(
          initialValue: name,
          onChanged: onNameChanged,
          decoration: InputDecoration(
            hintText: 'Enter your shop name'.hardcoded,
          ),
          validator: (val) =>
              val!.isEmpty ? 'Name is required'.hardcoded : null,
        ),
        gapH8,

        Text('Description *'.hardcoded, style: context.textTheme.titleMedium),
        gapH4,
        TextFormField(
          initialValue: description,
          onChanged: onDescriptionChanged,
          decoration: InputDecoration(
            hintText: 'Write information about your shop'.hardcoded,
          ),
          keyboardType: TextInputType.multiline,
          validator: (val) =>
              val!.isEmpty ? 'Description is required'.hardcoded : null,
        ),
        gapH8,

        // ... repeat for all other fields
        Text('Call Number'.hardcoded, style: context.textTheme.titleMedium),
        gapH4,
        TextFormField(
          initialValue: phone,
          onChanged: onPhoneChanged,
          decoration: InputDecoration(
            hintText: 'Enter your calling number'.hardcoded,
          ),
          keyboardType: TextInputType.number,
        ),
        gapH8,

        Text(
          'Messaging Number'.hardcoded,
          style: context.textTheme.titleMedium,
        ),
        gapH4,
        TextFormField(
          initialValue: messagingNumber,
          onChanged: onMessagingNumberChanged,
          decoration: InputDecoration(
            hintText: 'Enter your messaging number'.hardcoded,
          ),
          keyboardType: TextInputType.number,
        ),
        gapH8,

        Text('City Name *'.hardcoded, style: context.textTheme.titleMedium),
        gapH4,
        TextFormField(
          initialValue: city,
          onChanged: onCityChanged,
          decoration: InputDecoration(
            hintText: 'Enter your city name'.hardcoded,
          ),
          validator: (val) =>
              val!.isEmpty ? 'City name is required'.hardcoded : null,
        ),
        gapH8,

        Text('Sector Name *'.hardcoded, style: context.textTheme.titleMedium),
        gapH4,
        TextFormField(
          initialValue: sector,
          onChanged: onSectorChanged,
          decoration: InputDecoration(hintText: 'C4'.hardcoded),
          validator: (val) =>
              val!.isEmpty ? 'Sector name is required'.hardcoded : null,
        ),
        gapH8,

        Text(
          'Street Address *'.hardcoded,
          style: context.textTheme.titleMedium,
        ),
        gapH4,
        TextFormField(
          initialValue: street,
          onChanged: onStreetChanged,
          decoration: InputDecoration(
            hintText: 'Enter your street address'.hardcoded,
          ),
          validator: (val) =>
              val!.isEmpty ? 'Street address is required'.hardcoded : null,
        ),
        gapH8,

        Text('Email Address'.hardcoded, style: context.textTheme.titleMedium),
        gapH4,
        TextFormField(
          initialValue: email,
          onChanged: onEmailChanged,
          decoration: InputDecoration(
            hintText: 'Enter your email address'.hardcoded,
          ),
          keyboardType: TextInputType.emailAddress,
        ),
      ],
    );
  }
}
