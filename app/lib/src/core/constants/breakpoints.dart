/// Layout breakpoints used in the app.
class Breakpoint {
  static const double desktop = 840;
  static const double tablet = 600;
  static const double mobile = 300;
  static const double smallHeight = 450;
}

enum ScreenType {
  desktop(Breakpoint.desktop),
  tablet(Breakpoint.tablet),
  mobile(Breakpoint.mobile),
  smallHeight(Breakpoint.smallHeight);

  const ScreenType(this.value);

  final double value;

  factory ScreenType.determine({
    required double width,
    required double height,
  }) {
    if (height < Breakpoint.smallHeight) {
      return ScreenType.smallHeight;
    } else if (width >= Breakpoint.desktop) {
      return ScreenType.desktop;
    } else if (width >= Breakpoint.tablet) {
      return ScreenType.tablet;
    } else {
      return ScreenType.mobile;
    }
  }
}
