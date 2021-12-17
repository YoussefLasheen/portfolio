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
            
          )),
          Positioned.fill(
            child: BackdropFilter(
              filter: new ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
              child: new Container(
                color:Colors.grey[100].withOpacity(0.1)),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
