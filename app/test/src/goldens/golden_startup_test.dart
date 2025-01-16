import 'dart:ui';

import 'package:app/src/app.dart';
import 'package:flutter_test/flutter_test.dart';

import '../robot.dart';

void main() {
  final sizeVariant = ValueVariant<Size>({
    const Size(300, 600),
    const Size(600, 800),
    const Size(1000, 1000),
  });
  testWidgets('Golden - Startup', (tester) async {
    final r = Robot(tester);
    final currentSize = sizeVariant.currentValue!;
    final width = currentSize.width.toInt();
    final height = currentSize.height.toInt();
    await r.golden.setSurfaceSize(currentSize);
    await r.golden.loadRobotoFont();
    await r.golden.loadMaterialIconFont();
    await r.pumpMyApp();
    await r.golden.precacheImages();
    // [StartupScreen - 1]
    await expectLater(
      find.byType(MyApp),
      matchesGoldenFile('startup/1_startup_screen/image_$width x $height.png'),
    );

    // [StartupBottomSheetContent - 2]
    await r.startupRobot.tapGetStartedButton();
    await expectLater(
      find.byType(MyApp),
      matchesGoldenFile('startup/2_bottom_Sheet/image_$width x $height.png'),
    );

    // [StartupBottomSheetContent - 3]
    await r.startupRobot.tapGetCurrentButton();
    await expectLater(
      find.byType(MyApp),
      matchesGoldenFile('startup/3_bottom_Sheet/image_$width x $height.png'),
    );

    // [StartupBottomSheetContent - 4]
    await r.startupRobot.tapFromMapButton();
    await expectLater(
      find.byType(MyApp),
      matchesGoldenFile('startup/4_bottom_Sheet/image_$width x $height.png'),
    );

    // [PickLocation - 5]
    await r.startupRobot.tapFloatingCheckButton();
    await expectLater(
      find.byType(MyApp),
      matchesGoldenFile('startup/5_pick_location/image_$width x $height.png'),
    );

    // [StartupBottomSheetContent - 6]
    await r.startupRobot.tapSaveButton();
    await expectLater(
      find.byType(MyApp),
      matchesGoldenFile('startup/6_bottom_Sheet/image_$width x $height.png'),
    );
  }, variant: sizeVariant, tags: ['golden']);
}
