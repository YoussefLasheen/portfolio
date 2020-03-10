import 'package:flutter/material.dart';
import 'package:portfolio/Icons/FooterIconsFont.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterIcons extends StatelessWidget {
  const FooterIcons({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: FooterIcon(
              iconData: FooterIconsFont.facebook_rect,
              url: 'https://www.facebook.com/YoussefELasheen'),
        ),
        Expanded(
          child: FooterIcon(
              iconData: FooterIconsFont.twitter_bird,
              url: 'https://twitter.com/joelasheen'),
        ),
        Expanded(
          child: FooterIcon(
              iconData: FooterIconsFont.github_circled,
              url: 'https://github.com/YoussefLasheen'),
        ),
      ],
    );
  }
}

class FooterIcon extends StatelessWidget {
  final IconData iconData;
  final String url;
  const FooterIcon({Key key, this.iconData, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: FittedBox(
        child: Icon(
          iconData,
          color: Colors.black,
        ),
      ),
      onPressed: () async {
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw 'Could not launch $url';
        }
      },
    );
  }
}
