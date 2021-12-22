import 'package:decorated_icon/decorated_icon.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/Icons/icons.dart';
import 'package:portfolio/screens/shared_components/frostedglass_container.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactLinks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FrostedGlassContainer(
      decoration: BoxDecoration(color: Colors.black38,),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
        child: Column(
          children: [
            Expanded(
                child: InfoTile(
              icon: Icons.phone,
              text: "+201012845227",
              subText: "Phone",
              url: "url://+201012845227",
            )),
            Expanded(
                child: InfoTile(
              icon: Icons.email,
              text: "youssef@lasheen.dev",
              subText: "Email",
              url: "mailto:youssef@lasheen.dev",
            )),
            Expanded(
                child: InfoTile(
              icon: Icons.location_on,
              text: "Cairo, Egypt",
              subText: "Location",
              url: "https://www.google.com/maps/place/Cairo+Governorate",
            )),
            
            Expanded(
              child: Row(
                children: [
                  Flexible(
                    child: SocialIcon(
                      icon: CustomIcons.github_icon,
                      url: "https://github.com/YoussefLasheen",
                      color: Color(0xFF238636),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    child: SocialIcon(
                      icon: CustomIcons.linkedin_icon,
                      url: "http://linkedin.com/in/yousseflasheen",
                      color: Color(0xFF0a66c2),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    child: SocialIcon(
                      icon: CustomIcons.twitter_icon,
                      url: "https://twitter.com/joelasheen",
                      color: Color(0xFF1d9bf0),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class InfoTile extends StatelessWidget {
  final String? text;
  final String? subText;
  final String? url;
  final IconData? icon;
  const InfoTile({this.text, this.url, this.icon, this.subText});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: SelectableText(text!),
      subtitle: Text(subText!),
      onTap: () async {
        if (await canLaunch(url!)) {
          await launch(url!);
        } else {
          throw 'Could not launch $url';
        }
      },
    );
  }
}

class SocialIcon extends StatelessWidget {
  final IconData? icon;
  final Color? color;
  final url;
  const SocialIcon({this.icon, this.url, this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw 'Could not launch $url';
        }
      },
      child: Center(
        child: DecoratedIcon(
          icon!,
          color: color,
          shadows: [BoxShadow(color: Colors.white24, blurRadius: 5, offset: Offset(2, 2))],
          size: 72,
        ),
      ),
    );
  }
}
