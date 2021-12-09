import 'package:auto_route/auto_route.dart';
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
    return Column(
      children: [
        Expanded(
          child: Row(
            children: <Widget>[
              isLandscape
                  ? Spacer()
                  : Spacer(
                      flex: 4,
                    ),
              Expanded(
                flex: isLandscape ? 20 : 60,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Spacer(
                      flex: 6,
                    ),
                    Expanded(
                      flex: isLandscape ? 10 : 6,
                      child: AutoSizeText(
                        "Hello, I'm\nYoussef Lasheen",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 150),
                        maxLines: 2,
                      ),
                    ),
                    Spacer(
                      flex: 2,
                    ),
                    Expanded(
                      flex: 10,
                      child: AutoSizeText(
                        'A freelance Flutter developer based in Egypt.\nI make quality, commented, and reusable code.\nMy services include product analysis through to full product design - from wireframing and prototyping to interface design and Flutter development.',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 30,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ),
                    !isLandscape
                        ? Container()
                        : Expanded(
                            flex: 3,
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 3,
                                  child: SizedBox.expand(
                                    child: OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        backgroundColor: Color(0xFF323941),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(1500.0),
                                        ),
                                      ),
                                      onPressed: () {
                                        _launchURL();
                                      },
                                      child: SizedBox.expand(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: FittedBox(
                                            child: Text(
                                              'DOWNLOAD CV',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: SizedBox.expand(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Color(0xFFc34372),
                                        shape: CircleBorder()
                                      ),
                                      onPressed: () {
                                        context.tabsRouter.setActiveIndex(1);
                                      },
                                      child: SizedBox.expand(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: FittedBox(
                                              child: Icon(Icons
                                                  .arrow_downward_rounded)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Spacer(
                                  flex: 8,
                                )
                              ],
                            ),
                          ),
                    Spacer(
                      flex: 12,
                    )
                  ],
                ),
              ),
              Spacer(
                flex: 4,
              ),
              isLandscape
                  ? Expanded(
                      flex: 10,
                      child: Column(
                        children: <Widget>[
                          Spacer(),
                          Expanded(
                              flex: 5,
                              child: Image.asset(
                                'assets/images/P1Logo.png',
                                fit: BoxFit.contain,
                              )),
                          Spacer(
                            flex: 3,
                          )
                        ],
                      ),
                    )
                  : Container(),
              isLandscape
                  ? Spacer(
                      flex: 4,
                    )
                  : Container(),
            ],
          ),
        ),
        isLandscape
            ? Container()
            : SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: FlatButton(
                        onPressed: () {
                          _launchURL();
                        },
                        color: Color(0xFF323941),
                        child: Text("DOWNLOAD CV"),
                      ),
                    ),
                    Expanded(
                        child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xFFc34372),
                      ),
                      onPressed: () {
                        context.tabsRouter.setActiveIndex(1);
                      },
                      child: Text(
                        "VIEW PROJECTS",
                        style: TextStyle(color: Colors.white),
                      ),
                    ))
                  ],
                ),
              )
      ],
    );
  }
}

_launchURL() async {
  DocumentSnapshot snapshot = await Api('Data').getDocumentById('about_screen');
  String url = snapshot.get('CVDownloadURL');
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
