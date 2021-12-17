import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/assets/constants.dart';

class FrostedGlassContainer extends StatelessWidget {
  final Widget child;
  final Decoration decoration;

  const FrostedGlassContainer(
      {Key key,
      this.child,
      this.decoration = const BoxDecoration(gradient: mainGradient)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Stack(
        children: [
          Positioned.fill(
              child: Container(
            decoration: decoration,
            foregroundDecoration: BoxDecoration(
              border: Border.all(
                  color: Colors.white.withOpacity(0.3),
                  width: 0.3,
                  style: BorderStyle.solid),
            ),
          )),
          Positioned.fill(
            child: BackdropFilter(
              filter: new ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: new Container(
                color:Colors.grey[100].withOpacity(0.05))
            ),
          ),
          child,
        ],
      ),
    );
  }
}
