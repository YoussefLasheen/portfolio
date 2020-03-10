import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:portfolio/screens/projects_screen/models/project.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetails extends StatelessWidget {
  const ProjectDetails({Key key, this.project}) : super(key: key);
  final Project project;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    String body = project.details['body'].replaceAll('<br/>', '\n');
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: screenHeight * 0.25,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(project.title),
              background: Hero(
                tag: project.title + 'image',
                child: project.imgSrc == null
                    ? Placeholder()
                    : Image.network(
                        project.imgSrc,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: true,
            child: Center(
              child: FractionallySizedBox(
                widthFactor: isLandscape ? 3 / 4 : 1,
                child: Markdown(
                  data: body,
                  onTapLink: (String url) => _launchURL(url),
                  styleSheet: MarkdownStyleSheet(
                    blockSpacing: 20,
                  ),
                ),
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
