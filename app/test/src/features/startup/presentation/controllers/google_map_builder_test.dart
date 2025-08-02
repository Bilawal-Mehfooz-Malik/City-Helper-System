import 'package:app/src/features/startup/presentation/controllers/google_map_builder.dart';
import 'package:app/src/features/startup/presentation/widgets/google_map_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  group('GoogleMapBuilder', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test(
      'googleMapBuilderProvider returns RealGoogleMapWidget with correct LatLng',
      () {
        const testLatLng = LatLng(1.0, 2.0);
        final builder = container.read(googleMapBuilderProvider);
        final widget = builder(testLatLng);

        expect(widget, isA<RealGoogleMapWidget>());
        expect((widget as RealGoogleMapWidget).latLng, testLatLng);
      },
    );
  });
}
