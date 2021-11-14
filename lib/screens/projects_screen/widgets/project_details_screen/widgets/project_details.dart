import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:portfolio/screens/projects_screen/models/project.dart';
import 'package:portfolio/services/api.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetails extends StatelessWidget {
  const ProjectDetails({this.projectMetadata});
  final ProjectMetadata projectMetadata;
  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return FutureBuilder<DocumentSnapshot>(
      future: Future.delayed(
            const Duration(
              milliseconds: 350,
            ), () {
          return Api('Data/projects_screen/projects').getDocumentById(projectMetadata.id);
        }),
      builder: (context, snapshot) {
        ProjectDescription projectContent;
          if (!snapshot.hasData) {
            projectContent = ProjectDescription(text: 'asfd',projectMetadata: projectMetadata);
          } else {
            projectContent = ProjectDescription(text: snapshot.data['content'],projectMetadata: projectMetadata);
          }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: FractionallySizedBox(
            widthFactor: isLandscape ? 3 / 4 : 1,
            child: Column(
              children: [
                Text(projectContent.projectMetadata.title),
                PlatformIndicator({'Android':true,'Ios':true,'Web':true,'Windows':true,'Mac':true,'Linux':true,}),
                LicenseIndicator(),
                MarkdownBody(
                  data: projectMetadata.title,
                  onTapLink: (String url) => _launchURL(url),
                  styleSheet: MarkdownStyleSheet(
                    blockSpacing: 20,
                  ),
                  selectable: true,
                ),
              ],
            ),
          ),
        );
      }
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

class PlatformIndicator extends StatelessWidget {
  const PlatformIndicator(this.platforms);
  final Map platforms;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text("Available for"),
      platforms['Android']==true?Icon(Icons.android):Container(),
      platforms['Ios']==true?Icon(Icons.phone_iphone_rounded):Container(),
      platforms['Web']==true?Icon(Icons.language):Container(),
      platforms['Windows']==true?Icon(Icons.window):Container(),
      platforms['Mac']==true?Icon(Icons.laptop_mac):Container(),
      platforms['Linux']==true?Icon(Icons.precision_manufacturing_outlined):Container()
    ],);
  }
}

class LicenseIndicator extends StatelessWidget {
  const LicenseIndicator();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("License is:"),
        Icon(Icons.military_tech)
      ],
    );
  }
}