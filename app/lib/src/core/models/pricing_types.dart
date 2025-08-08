import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum PricingUnit {
  person(label: 'Person', icon: FontAwesomeIcons.user),
  bed(label: 'Bed', icon: FontAwesomeIcons.bed),
  room(label: 'Room', icon: FontAwesomeIcons.doorOpen),
  house(label: 'Full House', icon: FontAwesomeIcons.house),
  floor(label: 'Floor', icon: FontAwesomeIcons.building),
  property(label: 'Property', icon: FontAwesomeIcons.building);

  const PricingUnit({required this.label, required this.icon});
  final String label;
  final IconData icon;
}

enum PricingPeriod {
  hourly(label: 'hour'),
  daily(label: 'day'),
  monthly(label: 'month'),
  oneTime(label: 'one-time');

  const PricingPeriod({required this.label});
  final String label;
}
