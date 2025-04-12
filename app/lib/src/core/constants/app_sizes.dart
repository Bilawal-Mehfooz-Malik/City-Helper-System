import 'package:flutter/material.dart';

/// Constant sizes to be used in the app (paddings, gaps, rounded corners etc.)
class Sizes {
  const Sizes._();
  static const p4 = 4.0;
  static const p8 = 8.0;
  static const p12 = 12.0;
  static const p16 = 16.0;
  static const p20 = 20.0;
  static const p24 = 24.0;
  static const p32 = 32.0;
  static const p40 = 40.0;
  static const p48 = 48.0;
  static const p56 = 56.0;
  static const p64 = 64.0;
}

/// Constant gap widths
const gapW4 = SizedBox(width: Sizes.p4);
const gapW8 = SizedBox(width: Sizes.p8);
const gapW12 = SizedBox(width: Sizes.p12);
const gapW16 = SizedBox(width: Sizes.p16);
const gapW20 = SizedBox(width: Sizes.p20);
const gapW24 = SizedBox(width: Sizes.p24);
const gapW32 = SizedBox(width: Sizes.p32);
const gapW48 = SizedBox(width: Sizes.p48);
const gapW64 = SizedBox(width: Sizes.p64);

/// Constant gap heights
const gapH4 = SizedBox(height: Sizes.p4);
const gapH8 = SizedBox(height: Sizes.p8);
const gapH12 = SizedBox(height: Sizes.p12);
const gapH16 = SizedBox(height: Sizes.p16);
const gapH20 = SizedBox(height: Sizes.p20);
const gapH24 = SizedBox(height: Sizes.p24);
const gapH32 = SizedBox(height: Sizes.p32);
const gapH48 = SizedBox(height: Sizes.p48);
const gapH64 = SizedBox(height: Sizes.p64);

/// Sliver equivalents of gap widths (reusing gap variables)
final sliverGapW4 = SliverToBoxAdapter(child: gapW4);
final sliverGapW8 = SliverToBoxAdapter(child: gapW8);
final sliverGapW12 = SliverToBoxAdapter(child: gapW12);
final sliverGapW16 = SliverToBoxAdapter(child: gapW16);
final sliverGapW20 = SliverToBoxAdapter(child: gapW20);
final sliverGapW24 = SliverToBoxAdapter(child: gapW24);
final sliverGapW32 = SliverToBoxAdapter(child: gapW32);
final sliverGapW48 = SliverToBoxAdapter(child: gapW48);
final sliverGapW64 = SliverToBoxAdapter(child: gapW64);

/// Sliver equivalents of gap heights (reusing gap variables)
final sliverGapH4 = SliverToBoxAdapter(child: gapH4);
final sliverGapH8 = SliverToBoxAdapter(child: gapH8);
final sliverGapH12 = SliverToBoxAdapter(child: gapH12);
final sliverGapH16 = SliverToBoxAdapter(child: gapH16);
final sliverGapH20 = SliverToBoxAdapter(child: gapH20);
final sliverGapH24 = SliverToBoxAdapter(child: gapH24);
final sliverGapH32 = SliverToBoxAdapter(child: gapH32);
final sliverGapH48 = SliverToBoxAdapter(child: gapH48);
final sliverGapH64 = SliverToBoxAdapter(child: gapH64);
