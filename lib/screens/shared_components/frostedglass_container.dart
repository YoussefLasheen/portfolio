import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/assets/constants.dart';



final hoveringStateProvider = StateProvider<bool>((ref) {
  return false;
});

class FrostedGlassContainer extends ConsumerWidget {
  final Widget? child;
  final BorderRadius borderRadius;
  final Decoration decoration;

  const FrostedGlassContainer(
      {Key? key,
      this.child,
      this.decoration = const BoxDecoration(gradient: mainGradient,), required this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: MouseRegion(
        onEnter: (_){
          ref.read(hoveringStateProvider.state).state = true;
        },
        onExit: (_){
          ref.read(hoveringStateProvider.state).state = false;
        },
        child: Stack(
          children: [
            Positioned.fill(
              child: Consumer(
                builder: (_, WidgetRef ref, __){
                  final value = ref.watch(hoveringStateProvider);
                  return Container(
                    decoration: decoration,
                );
                },
              ),
            ),
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
                    borderRadius: borderRadius,
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
      ),
    );
  }
}
