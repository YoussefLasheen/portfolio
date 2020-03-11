import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:portfolio/services/api.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Row(
      children: <Widget>[
        isLandscape ? Container() : Spacer(),
        Expanded(
          flex: isLandscape ? 5 : 15,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Spacer(
                flex: 3,
              ),
              Expanded(
                flex: isLandscape ? 5 : 3,
                child: AutoSizeText(
                  "Hello, I'm\nYoussef Lasheen",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 150),
                  maxLines: 2,
                ),
              ),
              Expanded(
                flex: 6,
                child: AutoSizeText(
                  'A freelance Flutter developer based in Egypt.\nI make quality, commented, and reusable code.\nMy services include product analysis through to full product design - from wireframing and prototyping to interface design and Flutter development.',
                  style: TextStyle(color: Colors.grey, fontSize: 50),
                ),
              ),
              Expanded(
                flex: isLandscape? 2:1,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: isLandscape? 2:4,
                      child: SizedBox.expand(
                        child: FlatButton(
                          onPressed: () {
                            _launchURL();
                          },
                          child: FittedBox(child: Text('Download CV')),
                          color: Color(0xFF323941),
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(1500.0),
                          ),
                        ),
                      ),
                    ),
                    Spacer(
                      flex: 4,
                    )
                  ],
                ),
              ),
              Spacer(
                flex: 6,
              )
            ],
          ),
        ),
        Spacer(),
        isLandscape
            ? Expanded(
                flex: 3,
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Image.asset('assets/images/P1Logo.png'),
                    Spacer(
                      flex: 3,
                    )
                  ],
                ),
              )
            : Container(),
        isLandscape ? Spacer() : Container(),
      ],
    );
  }
}

_launchURL() async {
  DocumentSnapshot snapshot = await Api('Data').getDocumentById('about_screen');
  String url = snapshot.data['CVDownloadURL'];
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
