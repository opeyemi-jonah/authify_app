import 'package:flutter/material.dart';

class SlidePageRoute extends PageRouteBuilder {
  final Widget child;

  SlidePageRoute(this.child)
      : super(
          transitionDuration: const Duration(milliseconds: 500),
          transitionsBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation, Widget child) {
            // Animate the position using Tween<Offset>
            final offsetAnimation = Tween<Offset>(
              begin: Offset(-1, 0), // Start position
              end: Offset(0, 0),   // End position
            ).animate(animation);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) =>
              child,
        );
}
