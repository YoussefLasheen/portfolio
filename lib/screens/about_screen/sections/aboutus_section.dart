import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/assets/constants.dart';

class AboutusSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return ConstrainedBox(
      constraints: BoxConstraints.expand(height: 300),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  'About Us',
                  maxLines: 1,
                  style: TextStyle(fontSize: 70),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Container(
                        width: 30,
                        height: 10,
                        color: mainColor,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        'A freelance Flutter developer based in Egypt. I make quality, commented, and reusable code. My services include product analysis through to full product design - from wireframing and prototyping to interface design and Flutter development. ',
                        style: TextStyle(
                          color: Colors.white70,
                          height: 1.5,
                          wordSpacing: 1.5
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          isLandscape
              ? Expanded(
                flex: 2 ,
                child: Row(
                    children: [
                      Spacer(
                        flex: 2,
                      ),
                      Expanded(
                        child: Image.asset(
                          'assets/images/P1Logo.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      Spacer()
                    ],
                  ),
              )
              : SizedBox.shrink()
        ],
      ),
    );
  }
}
