import 'package:flutter/material.dart';
import 'package:portfolio/assets/constants.dart';
import 'package:seo_renderer/seo_renderer.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AccessOptions extends StatelessWidget {
  final List? accessOptions;

  const AccessOptions({Key? key, this.accessOptions});
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return accessOptions!.isEmpty?
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
              child: Material(
                color: Color(0xFF323941),
                child: InkWell(
                  onTap: () {
                    _launchURL(accessOptions!.first['url']);
                  },
                  child: Center(
                    child: TextRenderer(
                      child: Text(
                        accessOptions![0]['value'],
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            accessOptions!.length==1?
            Container():
            Expanded(
              child: Material(
                color: mainColor,
                child: PopupMenuButton(
                  child: Icon(Icons.more_vert_rounded),
                  tooltip: "More Options",
                  offset: isLandscape? Offset(-MediaQuery.of(context).size.width*0.105,screenHeight *0.1):Offset.zero,
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<AccessOptions>>[
                    for (var option in accessOptions!.sublist(1))
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
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url);
  } else {
    throw 'Could not launch $url';
  }
}
