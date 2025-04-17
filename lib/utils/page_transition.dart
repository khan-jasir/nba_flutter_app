import 'package:flutter/material.dart';

/// A generic method for navigating with custom transitions
Future<T?> pushWithTransition<T>(
  BuildContext context,
  Widget page, {
  Duration duration = const Duration(milliseconds: 800),
  Offset beginOffset = const Offset(1.0, 0.0), // from right
  Curve curve = Curves.easeOut,
}) {
  return Navigator.push<T>(
    context,
    PageRouteBuilder(
      transitionDuration: duration,
      pageBuilder: (_, __, ___) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final offsetAnimation = Tween<Offset>(
          begin: beginOffset,
          end: Offset.zero,
        ).animate(CurvedAnimation(parent: animation, curve: curve));

        final fadeAnimation = Tween<double>(
          begin: 0,
          end: 1,
        ).animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut));

        return SlideTransition(
          position: offsetAnimation,
          child: FadeTransition(
            opacity: fadeAnimation,
            child: child,
          ),
        );
      },
    ),
  );
}

/// A method for replacing the entire stack with a transition
Future<T?> pushAndRemoveUntilWithTransition<T>(
  BuildContext context,
  Widget page, {
  Duration duration = const Duration(milliseconds: 800),
  Offset beginOffset = const Offset(1.0, 0.0), // from right
  Curve curve = Curves.easeOut,
}) {
  return Navigator.pushAndRemoveUntil<T>(
    context,
    PageRouteBuilder(
      transitionDuration: duration,
      pageBuilder: (_, __, ___) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final offsetAnimation = Tween<Offset>(
          begin: beginOffset,
          end: Offset.zero,
        ).animate(CurvedAnimation(parent: animation, curve: curve));

        final fadeAnimation = Tween<double>(
          begin: 0,
          end: 1,
        ).animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut));

        return SlideTransition(
          position: offsetAnimation,
          child: FadeTransition(
            opacity: fadeAnimation,
            child: child,
          ),
        );
      },
    ),
    (route) => false,
  );
}


