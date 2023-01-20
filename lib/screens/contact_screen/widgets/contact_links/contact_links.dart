import 'package:flutter/material.dart';
import 'package:portfolio/assets/custom_icons.dart';
import 'package:portfolio/screens/shared_components/frostedglass_container.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactLinks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Column(
      children: [
        if (isLandscape)
        Spacer(),
        Expanded(
          flex: 1,
          child: Padding(
            padding: isLandscape? EdgeInsets.all(30.0): EdgeInsets.zero,
            child: FrostedGlassContainer(
              borderRadius: isLandscape? BorderRadius.circular(20.0): BorderRadius.zero,
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
        ),
        SizedBox(height: 50,),
        Expanded(
              child: Wrap(
                spacing: 100,
                runSpacing: 50,
                children: [
                  SocialIcon(
                    icon: CustomIcons.github_circled,
                    url: "https://github.com/lasheendev",
                    color: Color(0xFF238636),
                  ),
                  SocialIcon(
                    icon: CustomIcons.youtube,
                    url: "https://www.youtube.com/@lasheendev",
                    color: Color(0xFFe20202),
                  ),
                  SocialIcon(
                    icon: CustomIcons.facebook,
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
                    icon: CustomIcons.linkedin,
                    url: "https://www.linkedin.com/company/lasheendev",
                    color: Color(0xFF0a66c2),
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
  final IconData? icon;
  final Color? color;
  final url;
  const SocialIcon({this.icon, this.url, this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (await canLaunchUrlString(url)) {
          await launchUrlString(url);
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
