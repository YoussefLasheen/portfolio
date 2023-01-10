import 'package:flutter/material.dart';
import 'package:portfolio/assets/constants.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AccessOptions extends StatelessWidget {
  final Map? accessOptions;

  const AccessOptions({Key? key, this.accessOptions});
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return accessOptions!.isEmpty
        ? Container()
        : Align(
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
                          _launchURL(accessOptions!.entries.elementAt(0).value);
                        },
                        child: Center(
                          child: Text(
                            accessOptions!.entries.elementAt(0).key,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  accessOptions!.length == 1
                      ? Container()
                      : Expanded(
                          child: Material(
                            color: mainColor,
                            child: PopupMenuButton(
                              child: Icon(Icons.more_vert_rounded),
                              tooltip: "More Options",
                              offset: isLandscape
                                  ? Offset(
                                      -MediaQuery.of(context).size.width *
                                          0.105,
                                      screenHeight * 0.1)
                                  : Offset.zero,
                              itemBuilder: (BuildContext context) =>
                                  <PopupMenuEntry<AccessOptions>>[
                                for (var i = 1; i < accessOptions!.length; i++)
                                  PopupMenuItem(
                                    child: ListTile(
                                      title: Text(accessOptions!.entries.elementAt(i).key),
                                    ),
                                    onTap: () {
                                      _launchURL(accessOptions!.entries.elementAt(i).value);
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
