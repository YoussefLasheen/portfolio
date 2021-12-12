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
                child: Padding(
                  padding: const EdgeInsets.only(right: 60),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AutoSizeText(
                        "Hello, I'm\nYoussef Lasheen",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 150),
                        maxLines: 2,
                      ),
                      SizedBox(height: 20,),
                      AutoSizeText(
                        'A freelance Flutter developer based in Egypt.\nI make quality, commented, and reusable code.\nMy services include product analysis through to full product design - from wireframing and prototyping to interface design and Flutter development.',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 25,
                          fontWeight: FontWeight.w100,
                          height: 1.3
                        ),
                        maxLines: 6,
                      ),
                      SizedBox(height: 20,),
                      !isLandscape
                          ? Container()
                          : Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              OutlinedButton(
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
                                child: Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Text(
                                    'DOWNLOAD CV',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              FloatingActionButton(
                                backgroundColor: Color(0xFFc34372),
                                child: Icon(
                                  Icons.arrow_downward_rounded,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  context.tabsRouter.setActiveIndex(1);
                                },
                                ),
                            ],
                          ),
                    ],
                  ),
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
