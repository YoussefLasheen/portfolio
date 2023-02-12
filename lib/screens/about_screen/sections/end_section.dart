import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/screens/shared_components/frostedglass_container.dart';
import 'package:url_launcher/url_launcher.dart';

class EndSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Padding(
      padding: isLandscape
          ? EdgeInsets.only(right: 100, left: 50, bottom: 100)
          : EdgeInsets.zero,
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(height: isLandscape ? 500 : 800),
        child: FrostedGlassContainer(
          borderRadius: isLandscape
              ? BorderRadius.circular(20.0)
              : BorderRadius.circular(0.0),
          child: Center(
            child: FractionallySizedBox(
              heightFactor: 8 / 10,
              widthFactor: 9 / 10,
              child: Flex(
                direction: isLandscape ? Axis.horizontal : Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          'Ready to explore?',
                          maxLines: 2,
                          style: TextStyle(fontSize: 70),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Flexible(
                          child: AutoSizeText.rich(
                            TextSpan(
                              style: TextStyle(fontSize: 25),
                              children: [
                                TextSpan(
                                  text:
                                      'If you would like to discuss your project with us and receive a free consultation, please contact us via our website or call us at ',
                                ),
                                TextSpan(
                                  text: '+201012845227',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => launchUrl(Uri(
                                        scheme: 'tel', path: '+201012845227')),
                                ),
                                TextSpan(
                                  text:
                                      '\nWe look forward to hearing from you!',
                                ),
                              ],
                            ),
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                color: Colors.white54,
                                fontSize: 25,
                                height: 1.5),
                          ),
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  Center(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(5.0),
                        ),
                      ),
                      onPressed: () => context.go('/contact'),
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(
                          'Book for free',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
