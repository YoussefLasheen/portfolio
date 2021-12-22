import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/assets/constants.dart';

class FrostedGlassContainer extends StatelessWidget {
  final Widget? child;
  final Decoration decoration;

  const FrostedGlassContainer(
      {Key? key,
      this.child,
      this.decoration = const BoxDecoration(gradient: mainGradient,)})
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
              filter: new ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: new Container(
              )
            ),
          ),
          Positioned.fill(
            child: Opacity(
                  opacity: 0.1,
                  child: Image.asset(
                    "assets/textures/noise-300x300.png",
                    fit: BoxFit.scaleDown,
                    repeat: ImageRepeat.repeat,
                  )),
          ),
          Container(
              decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.25), blurRadius: 30, offset: Offset(2, 2))],
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: Colors.white.withOpacity(0.3), width: 0.3),
                  gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
                    Colors.white.withOpacity(0.1),
                    Colors.white.withOpacity(0.08),
                  ], stops: [
                    0.0,
                    1.0,
                  ])),
              child: child,
            ),
        ],
      ),
    );
  }
}
