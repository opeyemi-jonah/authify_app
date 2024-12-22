import 'package:flutter/material.dart';

class FadePageRoute extends PageRouteBuilder {
  final Widget child;

  FadePageRoute(this.child)
      : super(
          transitionDuration: const Duration(milliseconds: 500),
          transitionsBuilder: (BuildContext contect,
                  Animation<double> animation,
                  Animation<double> secondAnimation,
                  Widget child) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
          pageBuilder: (BuildContext context, animation, secondAnimation) =>
              child,
        );
}
