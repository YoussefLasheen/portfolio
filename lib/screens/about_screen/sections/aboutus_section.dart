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
                  style: Theme.of(context).textTheme.headline2,
                ),
                SizedBox(height: 25,),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                        child: Container(
                          width: 30,
                          height: 10,
                          color: mainColor,
                        ),
                      ),
                      Expanded(
                        child: AutoSizeText(
                          'We are a B2B software development company based in Cairo, Egypt. We specialize in creating custom software solutions for businesses of all sizes. Our team of experienced developers have years of experience in developing software solutions that are tailored to meet the specific needs of our clients. ',
                          style: TextStyle(
                            color: Colors.white60,
                            height: 1.5,
                            fontSize: 24,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          isLandscape?Spacer():SizedBox.shrink(),
          isLandscape
              ? Expanded(
                flex:2 ,
                child: Image.asset(
                  'assets/images/LLLogoClipArtOulined.webp',
                  fit: BoxFit.contain,
                ),
              )
              : SizedBox.shrink()
        ],
      ),
    );
  }
}
