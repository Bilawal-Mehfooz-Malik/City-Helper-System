// import 'package:flutter_test/flutter_test.dart';

// import '../test/src/robot.dart';

// void main() {
//   setUpAll(() => WidgetController.hitTestWarningShouldBeFatal = true);
//   testWidgets('Integration test (Mobile Screen) - Flow 1', (tester) async {
//     // * Note: All tests are wrapped with `runAsync` to prevent this error:
//     // * A Timer is still pending even after the widget tree was disposed.
//     await tester.runAsync(() async {
//       final r = Robot(tester);
//       await r.pumpAppWithMobileScreen();
//       await r.startupRobot.tapGetStartedButton();
//       r.startupRobot.expectModalBottomSheet();
//       await r.startupRobot.tapGetCurrentButton();
//       await r.startupRobot.tapSaveButton();
//       r.categoriesRobot.expectCategoriesScreen();
//       await r.categoriesRobot.tapCategory();
//       r.categoriesRobot.expectHomeScreen();
//       r.categoriesRobot.expectItemCard();
//     });
//   });

//   testWidgets('Integration test (Desktop Screen) - Flow 1', (tester) async {
//     await tester.runAsync(() async {
//       final r = Robot(tester);
//       await r.pumpAppWithDesktopScreen();
//       await r.startupRobot.tapGetCurrentButton();
//       await r.startupRobot.tapSaveButton();
//       r.categoriesRobot.expectCategoriesScreen();
//       await r.categoriesRobot.tapCategory();
//       r.categoriesRobot.expectHomeScreen();
//       r.categoriesRobot.expectItemCard();
//     });
//   });

//   testWidgets('Integration test (Mobile Screen) - Flow 2', (tester) async {
//     await tester.runAsync(() async {
//       final r = Robot(tester);
//       await r.pumpAppWithMobileScreen();
//       await r.startupRobot.tapGetStartedButton();
//       r.startupRobot.expectModalBottomSheet();
//       await r.startupRobot.tapFromMapButton();
//       await r.startupRobot.tapMyLocationButton();
//       await r.startupRobot.tapFloatingCheckButton();
//       await r.startupRobot.tapSaveButton();
//       r.categoriesRobot.expectCategoriesScreen();
//       await r.categoriesRobot.tapCategory();
//       r.categoriesRobot.expectHomeScreen();
//       r.categoriesRobot.expectItemCard();
//     });
//   });

//   testWidgets('Integration test (Desktop Screen) - Flow 2', (tester) async {
//     await tester.runAsync(() async {
//       final r = Robot(tester);
//       await r.pumpAppWithDesktopScreen();
//       await r.startupRobot.tapFromMapButton();
//       await r.startupRobot.tapMyLocationButton();
//       await r.startupRobot.tapFloatingCheckButton();
//       await r.startupRobot.tapSaveButton();
//       r.categoriesRobot.expectCategoriesScreen();
//       await r.categoriesRobot.tapCategory();
//       r.categoriesRobot.expectHomeScreen();
//       r.categoriesRobot.expectItemCard();
//     });
//   });
// }
