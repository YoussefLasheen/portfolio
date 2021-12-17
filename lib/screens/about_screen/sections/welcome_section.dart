import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/assets/constants.dart';
import 'package:portfolio/screens/shared_components/frostedglass_container.dart';

class WelcomeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.expand(height: 400),
      child: Row(
        children: [
          Expanded(
            child: SizedBox.expand(
              child: AutoSizeText(
                'Turn your \namazing ideas \ninto reality',
                style: TextStyle(fontSize: 90),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Book an evaluation now for free. And get a price quote the same day guarnteed',
                  style: TextStyle(color: Colors.white70, fontSize: 24),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Special prices for NPOs',
                  style: TextStyle(color: Colors.white54),
                ),
                SizedBox(
                  height: 70,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ColoredButton(
                      text: 'ABOUT US',
                      onPressed: null,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    TextButton(
                      onPressed: null,
                      child: Ink(
                        decoration: BoxDecoration(
                          color: Colors.grey[600],
                            borderRadius: BorderRadius.circular(20)),
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
                    ),
                  ],
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
  final String text;
  final Function onPressed;

  const ColoredButton({Key key, this.onPressed, this.text})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FrostedGlassContainer(
      child: TextButton(
        onPressed: onPressed,
        child: Ink(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(1500)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Text(
              text,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
