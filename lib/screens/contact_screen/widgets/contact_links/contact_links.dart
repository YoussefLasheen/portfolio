import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/Icons/icons.dart';
import 'package:portfolio/screens/shared_components/frostedglass_container.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactLinks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: FrostedGlassContainer(
            borderRadius: BorderRadius.circular(20.0),
            decoration: BoxDecoration(color: Colors.black26,),
            child: Center(
              child: FractionallySizedBox(
                widthFactor: 8/10,
                heightFactor: 7/10,
                child: Column(
                  children: [
                    Expanded(
                        child: InfoTile(
                      icon: Icons.email,
                      text: "youssef@lasheen.dev",
                      subText: "Email",
                      url: "mailto:youssef@lasheen.dev",
                    )),
                    Expanded(
                        child: InfoTile(
                      icon: Icons.phone,
                      text: "+201012845227",
                      subText: "Phone",
                      url: "url://+201012845227",
                    )),
                    Expanded(
                        child: InfoTile(
                      icon: Icons.location_on,
                      text: "Cairo, Egypt",
                      subText: "Location",
                      url: "https://www.google.com/maps/place/Cairo+Governorate",
                    )),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 50,),
        Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SocialIcon(
                    icon: FontAwesomeIcons.githubAlt,
                    url: "https://github.com/YoussefLasheen",
                    color: Color(0xFF238636),
                  ),
                  SocialIcon(
                    icon: FontAwesomeIcons.linkedinIn,
                    url: "http://linkedin.com/in/yousseflasheen",
                    color: Color(0xFF0a66c2),
                  ),
                  SocialIcon(
                    icon: FontAwesomeIcons.stackOverflow,
                    url: "https://stackoverflow.com/users/10240634/youssef-lasheen",
                    color: Color(0xFFef8236),
                  ),
                  SocialIcon(
                    icon: FontAwesomeIcons.twitter,
                    url: "https://twitter.com/joelasheen",
                    color: Color(0xFF1d9bf0),
                  ),
                ],
              ),
            )
      ],
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
      child: SizedBox.fromSize(
        size: Size.square(72),
        child: FrostedGlassContainer(
          decoration: BoxDecoration(color: color!.withOpacity(0.6),),
          borderRadius: BorderRadius.circular(20.0),
          child: Center(
            child: Icon(
              icon!,
              color: color,
              size: 50,
            ),
          ),
        ),
      ),
    );
  }
}
