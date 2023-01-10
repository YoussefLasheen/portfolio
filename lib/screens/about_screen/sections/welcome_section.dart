import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/assets/constants.dart';
import 'package:portfolio/screens/shared_components/frostedglass_container.dart';

class WelcomeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return ConstrainedBox(
      constraints: isLandscape? BoxConstraints.expand(height: 400):BoxConstraints.expand(height: 600),
      child: Flex(
        direction: isLandscape?Axis.horizontal:Axis.vertical,
        children: [
          Expanded(
            child: SizedBox.expand(
              child: AutoSizeText(
                'Turn your \namazing ideas \ninto reality',
                style: TextStyle(fontSize: 90),
              ),
            ),
          ),
          SizedBox(width: 20,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                AutoSizeText(
                  'Book an evaluation now for free. And get a price quote the same day guarnteed',
                  style: TextStyle(color: Colors.white70, fontSize: 24),
                ),
                SizedBox(
                  height: 5,
                ),
                AutoSizeText(
                  'Special prices for NPOs',
                  style: TextStyle(color: Colors.white54),
                ),
                SizedBox(
                  height: 70,
                ),
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ColoredButton(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          child: Text(
                             'CONTACT US',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20),
                          ),
                        ),
                        onPressed: ()=> context.go('/contact'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      TextButton(
                        onPressed: ()=> context.go('/projects'),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.grey[700],
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          child: Text(
                            'VIEW WORK',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ColoredButton extends StatelessWidget {
  final Widget? child;
  final Function? onPressed;
  final Decoration decoration;

  const ColoredButton({Key? key, this.onPressed, this.child, this.decoration = const BoxDecoration(gradient: mainGradient)})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FrostedGlassContainer(
      borderRadius: BorderRadius.circular(20.0),
      decoration: decoration,
      child: TextButton(
        onPressed: onPressed as void Function()?,
        child: child!,
      ),
    );
  }
}
