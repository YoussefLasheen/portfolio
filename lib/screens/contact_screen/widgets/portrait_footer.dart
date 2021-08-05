import 'package:flutter/material.dart';
import 'package:portfolio/Icons/FooterIconsFont.dart';
import 'package:portfolio/screens/contact_screen/widgets/footer_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class PortraitFooter extends StatelessWidget {
  const PortraitFooter({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: Row(
        children: [
          Spacer(),
          Expanded(
            flex: 10,
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        children: [
                          Expanded(
                            child: ListTile(
                              leading: Icon(Icons.phone),
                              title: SelectableText("+201012845227"),
                              subtitle: Text("Phone"),
                            ),
                          ),
                          Expanded(
                            child: ListTile(
                              leading: Icon(Icons.mail),
                              title: SelectableText("youssef@lasheen.dev"),
                              subtitle: Text('Email'),
                              onTap: () async {
                                String url = 'mailto:youssef@lasheen.dev';
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                            ),
                          ),
                          Expanded(
                            child: ListTile(
                              leading: Icon(Icons.location_on),
                              title: SelectableText("Cairo, Egypt"),
                              subtitle: Text("Address"),
                              onTap: () async {
                                String url =
                                    'https://www.google.com/maps/place/Cairo+Governorate';
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: Row(
                      children: [
                        Expanded(
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: InkWell(
                              onTap: () async {
                                String url =
                                    'https://www.facebook.com/YoussefELasheen';
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                              splashColor: Colors.blue,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Center(
                                  child: Icon(
                                    FooterIconsFont.facebook_rect,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: InkWell(
                              onTap: () async {
                                String url = 'https://twitter.com/joelasheen';
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                              splashColor: Colors.lightBlueAccent,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Center(
                                  child: Icon(
                                    FooterIconsFont.twitter_bird,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: InkWell(
                              onTap: () async {
                                String url =
                                    'https://github.com/YoussefLasheen';
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                              splashColor: Colors.green,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Center(
                                  child: Icon(
                                    FooterIconsFont.github_circled,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Spacer()
        ],
      ),
    );
  }
}
