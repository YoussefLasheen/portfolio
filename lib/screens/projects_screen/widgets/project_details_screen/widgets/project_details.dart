import 'package:flutter/widgets.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetails extends StatelessWidget {
  const ProjectDetails({this.body});
  final String body;
  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FractionallySizedBox(
        widthFactor: isLandscape ? 3 / 4 : 1,
        child: MarkdownBody(
          data: body,
          onTapLink: (String url) => _launchURL(url),
          styleSheet: MarkdownStyleSheet(
            blockSpacing: 20,
          ),
          selectable: true,
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
