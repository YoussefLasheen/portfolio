import 'package:flutter/material.dart';
import 'package:portfolio/Icons/FooterIconsFont.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactLinks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Flexible(
              child: InfoTile(
            icon: Icons.phone,
            text: "+201012845227",
            url: "url://+201012845227",
          )),
          Flexible(
              child: InfoTile(
            icon: Icons.email,
            text: "youssef@lasheen.dev",
            url: "mailto:youssef@lasheen.dev",
          )),
          Flexible(
              child: InfoTile(
            icon: Icons.location_on,
            text: "Cairo, Egypt",
            url: "https://www.google.com/maps/place/Cairo+Governorate",
          )),
          Flexible(
            child: Row(
              children: [
                Flexible(
                  child: SocialIcon(
                    icon: FooterIconsFont.github_circled,
                    url: "https://github.com/YoussefLasheen",
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Flexible(
                  child: SocialIcon(
                    icon: FooterIconsFont.linkedin,
                    url: "http://linkedin.com/in/yousseflasheen",
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Flexible(
                  child: SocialIcon(
                    icon: FooterIconsFont.twitter_bird,
                    url: "https://twitter.com/joelasheen",
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class InfoTile extends StatelessWidget {
  final String text;
  final String url;
  final IconData icon;
  const InfoTile({this.text, this.url, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        color: Colors.black54,
        child: ListTile(
          leading: Icon(icon),
          title: SelectableText(text),
          subtitle: Text("Phone"),
          onTap: () async {
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw 'Could not launch $url';
            }
          },
        ),
      ),
    );
  }
}

class SocialIcon extends StatelessWidget {
  final icon;
  final url;
  const SocialIcon({this.icon, this.url});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: InkWell(
        onTap: () async {
          if (await canLaunch(url)) {
            await launch(url);
          } else {
            throw 'Could not launch $url';
          }
        },
        child: Container(
          color: Colors.black54,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
