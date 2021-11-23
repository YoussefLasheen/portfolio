import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AccessOptions extends StatelessWidget {
  final List accessOptions;

  const AccessOptions({Key key, this.accessOptions});
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return accessOptions.isEmpty?
    Container():
    Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: screenHeight * 0.1,
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 4,
              child: InkWell(
                onTap: () {
                  _launchURL(accessOptions[0]['url']);
                },
                child: Container(
                  color: Color(0xFF323941),
                  child: Center(
                    child: Text(
                      accessOptions[0]['value'],
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            accessOptions.length==1?
            Container():
            Expanded(
              child: Container(
                color: Color(0xFFc34372),
                child: PopupMenuButton(
                  offset: isLandscape? Offset(-MediaQuery.of(context).size.width*0.105,screenHeight *0.1):Offset.zero,
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<AccessOptions>>[
                    for (var option in accessOptions.sublist(1))
                      PopupMenuItem(
                        child: ListTile(
                          title: Text(option['value']),
                          leading: Icon(IconData(option['icon'],
                          fontFamily: 'MaterialIcons')),
                        ),
                        onTap: () {
                          _launchURL(option['url']);
                        },
                      )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
