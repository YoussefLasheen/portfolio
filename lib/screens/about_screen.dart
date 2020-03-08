import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
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
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc sed rhoncus neque. Pellentesque venenatis felis at risus rutrum porttitor ac sed turpis. Praesent vel iaculis lacus. Mauris maximus quam congue neque tincidunt aliquam vel in sapien.',
                  style: TextStyle(color: Colors.grey, fontSize: 50),
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: SizedBox.expand(
                        child: FlatButton(
                          onPressed: () {
                            _launchURL();
                          },
                          child: FittedBox(child: Text('Download CV')),
                          color: Color(0xFF323941),
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(50.0),
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
  const url =
      'https://firebasestorage.googleapis.com/v0/b/yousseflasheen-portfolio.appspot.com/o/Resume%20v4%20(1).pdf?alt=media&token=00434306-5ac2-408e-b7be-356692b6e05e';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
