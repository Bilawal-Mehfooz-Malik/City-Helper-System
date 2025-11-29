import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum PageTransitionType { fade, slide, scale, none }

class CustomAnimatedScreen<T> extends CustomTransitionPage<T> {
  final PageTransitionType transitionType;

  CustomAnimatedScreen({
    required super.child,
    super.key,
    super.name,
    super.arguments,
    super.restorationId,
    this.transitionType = PageTransitionType.none,
  }) : super(
         transitionDuration: const Duration(milliseconds: 300),
         reverseTransitionDuration: const Duration(milliseconds: 300),
         transitionsBuilder: (context, animation, secondaryAnimation, child) =>
             _TransitionBuilder(
               transitionType: transitionType,
               animation: animation,
               secondaryAnimation: secondaryAnimation,
               child: child,
             ),
       );
}

class MaterialCustomAnimatedScreen<T> extends PageRouteBuilder<T> {
  final Widget child;
  final PageTransitionType transitionType;

  MaterialCustomAnimatedScreen({
    required this.child,
    this.transitionType = PageTransitionType.none,
  }) : super(
         pageBuilder: (context, animation, secondaryAnimation) => child,
         transitionDuration: const Duration(milliseconds: 300),
         reverseTransitionDuration: const Duration(milliseconds: 300),
         transitionsBuilder: (context, animation, secondaryAnimation, child) {
           return _TransitionBuilder(
             transitionType: transitionType,
             animation: animation,
             secondaryAnimation: secondaryAnimation,
             child: child,
           );
         },
       );
}

class _TransitionBuilder extends StatelessWidget {
  final PageTransitionType transitionType;
  final Animation<double> animation;
  final Animation<double> secondaryAnimation;
  final Widget child;

  const _TransitionBuilder({
    required this.transitionType,
    required this.animation,
    required this.secondaryAnimation,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    switch (transitionType) {
      case .fade:
        return _FadeTransition(animation: animation, child: child);

      case .slide:
        return _SharedAxisSlideTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        );

      case .scale:
        return _ScaleTransition(animation: animation, child: child);

      case .none:
        return child;
    }
  }
}

/// Fade Transition Widget
class _FadeTransition extends StatelessWidget {
  final Animation<double> animation;
  final Widget child;

  const _FadeTransition({required this.animation, required this.child});

  @override
  Widget build(BuildContext context) {
    return FadeTransition(opacity: animation, child: child);
  }
}

/// Shared Axis Slide Transition - Both screens move together (like WhatsApp)
class _SharedAxisSlideTransition extends StatelessWidget {
  final Animation<double> animation;
  final Animation<double> secondaryAnimation;
  final Widget child;

  const _SharedAxisSlideTransition({
    required this.animation,
    required this.secondaryAnimation,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1.0, 0.0), // New screen starts from right
        end: Offset.zero, // Ends at center
      ).animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut)),
      child: SlideTransition(
        position:
            Tween<Offset>(
              begin: Offset.zero, // Old screen starts at center
              end: const Offset(-0.3, 0.0), // Slides slightly to the left
            ).animate(
              CurvedAnimation(
                parent: secondaryAnimation,
                curve: Curves.easeInOut,
              ),
            ),
        child: child,
      ),
    );
  }
}

/// Scale Transition Widget
class _ScaleTransition extends StatelessWidget {
  final Animation<double> animation;
  final Widget child;

  const _ScaleTransition({required this.animation, required this.child});

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(scale: animation, child: child);
  }
}
