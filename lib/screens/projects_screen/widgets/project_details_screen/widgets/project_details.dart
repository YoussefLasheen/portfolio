import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:portfolio/screens/projects_screen/models/project.dart';
import 'package:portfolio/services/api.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetails extends StatelessWidget {
  const ProjectDetails({this.projectDescription});
  final ProjectDescription projectDescription;
  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return 
           Theme(
            data: ThemeData.light(),
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  height: isLandscape
                      ? (3 / 5) * screenHeight
                      : 1.25 * screenHeight,
                  width: screenWidth,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 100.0),
                    child: Column(
                      children: [
                        Flexible(
                          flex: 2,
                          child: SizedBox(
                            width: isLandscape
                                ? (1 / 3) * screenWidth
                                : screenWidth * 0.9,
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "PROJECT",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1),
                                    ),
                                    Container(
                                      height: 3,
                                      width: 30,
                                      color: Colors.black54,
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: AutoSizeText(
                                      projectDescription
                                          .infoSnippet['longDescription'],
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 40),
                                      wrapWords: true,
                                      maxFontSize: 50,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        if (isLandscape)
                          Flexible(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Flexible(
                                          child: FittedBox(
                                              child: InfoSnippet(
                                                  'ROLE',
                                                  projectDescription
                                                      .infoSnippet['role']))),
                                      Spacer(),
                                      Flexible(
                                          child: FittedBox(
                                              child: InfoSnippet(
                                                  'DATE',
                                                  projectDescription
                                                      .infoSnippet['date']))),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Flexible(
                                          child: FittedBox(
                                              child: InfoSnippet(
                                                  'CREDITS',
                                                  projectDescription.infoSnippet[
                                                      'credits']))),
                                      Spacer(),
                                      Flexible(
                                          child: FittedBox(
                                              child: InfoSnippet(
                                                  'CLIENT',
                                                  projectDescription
                                                      .infoSnippet['client']))),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        else
                          Flexible(
                            child: SizedBox(
                              width: screenWidth * 0.9,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Flexible(
                                            child: FittedBox(
                                                child: InfoSnippet(
                                                    'ROLE',
                                                    projectDescription
                                                        .infoSnippet['role']))),
                                        SizedBox(
                                          height: 50,
                                        ),
                                        Flexible(
                                            child: FittedBox(
                                                child: InfoSnippet(
                                                    'DATE',
                                                    projectDescription
                                                        .infoSnippet['date']))),
                                      ],
                                    ),
                                  ),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Flexible(
                                            child: FittedBox(
                                                child: InfoSnippet(
                                                    'CREDITS',
                                                    projectDescription.infoSnippet[
                                                        'credits']))),
                                        SizedBox(
                                          height: 50,
                                        ),
                                        Flexible(
                                            child: FittedBox(
                                                child: InfoSnippet(
                                                    'CLIENT',
                                                    projectDescription.infoSnippet[
                                                        'client']))),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                ),
                if (projectDescription.projectMetadata.backgroundImageSource == null) 
                Center(child: CircularProgressIndicator(),) 
                else Container(
                  width: MediaQuery.of(context).size.width,
                  height: 750,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image:
                          NetworkImage(projectDescription.projectMetadata.backgroundImageSource),
                    ),
                  ),
                ),
              ],
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

class InfoSnippet extends StatelessWidget {
  final String text;
  final String subText;

  const InfoSnippet(this.text, this.subText);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              wordSpacing: 1),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 3,
          width: 30,
          color: Colors.black,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          subText,
          style: TextStyle(color: Colors.black87, fontSize: 20),
        )
      ],
    );
  }
}

class PlatformIndicator extends StatelessWidget {
  const PlatformIndicator(this.platforms);
  final Map platforms;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Available for"),
        platforms['Android'] == true ? Icon(Icons.android) : Container(),
        platforms['Ios'] == true
            ? Icon(Icons.phone_iphone_rounded)
            : Container(),
        platforms['Web'] == true ? Icon(Icons.language) : Container(),
        platforms['Windows'] == true ? Icon(Icons.window) : Container(),
        platforms['Mac'] == true ? Icon(Icons.laptop_mac) : Container(),
        platforms['Linux'] == true
            ? Icon(Icons.precision_manufacturing_outlined)
            : Container()
      ],
    );
  }
}

class LicenseIndicator extends StatelessWidget {
  const LicenseIndicator();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Text("License is:"), Icon(Icons.military_tech)],
    );
  }
}
