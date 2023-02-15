import 'package:flutter/material.dart';
import 'package:portfolio/assets/custom_icons.dart';
import 'package:portfolio/screens/shared_components/frostedglass_container.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactLinks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Material(
      color: Colors.transparent,
      child: GridView.count(
        crossAxisCount: isLandscape ? 4 : 3,
        semanticChildCount: 8,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 1,
        shrinkWrap: true,
        scrollDirection: isLandscape ? Axis.vertical : Axis.horizontal,
        children: [
          SocialIcon(
            icon: CustomIcons.github,
            url: "https://github.com/lasheendev",
            color: Color(0xFF238636),
          ),
          SocialIcon(
            icon: CustomIcons.youtube_play,
            url: "https://www.youtube.com/@lasheendev",
            color: Color(0xFFe20202),
            size: 60,
          ),
          SocialIcon(
            icon: CustomIcons.facebook_f,
            url: "https://web.facebook.com/lasheendev",
            color: Color(0xFF0d8bf0),
          ),
          SocialIcon(
            icon: CustomIcons.instagram,
            url: "https://www.instagram.com/lasheen.dev",
            color: Colors.orange,
          ),
          SocialIcon(
            icon: CustomIcons.twitter,
            url: "https://twitter.com/lasheendev",
            color: Color(0xFF1da1fa),
          ),
          SocialIcon(
            icon: CustomIcons.linkedin_in,
            url: "https://www.linkedin.com/company/lasheendev",
            color: Color(0xFF0a66c2),
          ),
          SocialIcon(
            icon: CustomIcons.snapcraft,
            url: "https://www.linkedin.com/company/lasheendev",
            color: Color(0xFF7bb498),
          ),
          SocialIcon(
            icon: CustomIcons.google_play,
            url: "https://www.linkedin.com/company/lasheendev",
            color: Colors.orangeAccent,
            size: 60,
          ),
        ],
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
      title: Text(text!),
      subtitle: Text(subText!),
      onTap: () async {
        if (await canLaunchUrlString(url!)) {
          await launchUrlString(url!);
        } else {
          throw 'Could not launch $url';
        }
      },
    );
  }
}

class SocialIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String url;
  final double size;
  const SocialIcon(
      {required this.icon,
      required this.url,
      required this.color,
      this.size = 65});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () async {
        if (await canLaunchUrlString(url)) {
          await launchUrlString(url);
        } else {
          throw 'Could not launch $url';
        }
      },
      splashColor: Colors.white,
      child: FrostedGlassContainer(
        decoration: BoxDecoration(
          color: color!.withOpacity(0.4),
        ),
        borderRadius: BorderRadius.circular(20.0),
        child: Center(
          child: Icon(
            icon!,
            shadows: [
              Shadow(
                color: Colors.white24,
                offset: Offset(0, 0),
                blurRadius: 10,
              ),
            ],
            color: color,
            size: size,
          ),
        ),
      ),
    );
  }
}
