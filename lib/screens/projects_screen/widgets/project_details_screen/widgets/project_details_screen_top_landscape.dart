import 'package:flutter/material.dart';
import 'package:portfolio/screens/projects_screen/models/project.dart';
import 'package:portfolio/screens/projects_screen/widgets/project_details_screen/widgets/project_details.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetailsScreenTopLandscape extends StatelessWidget {
  const ProjectDetailsScreenTopLandscape({
    @required this.projectMetadata,
    @required this.isInversed,
  });
  final ProjectMetadata projectMetadata;
  final bool isInversed;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Material(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: screenWidth,
                  height: screenHeight,
                  child: Flex(
                    direction: isLandscape ? Axis.horizontal : Axis.vertical,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    textDirection:
                        isInversed ? TextDirection.rtl : TextDirection.ltr,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: projectMetadata.backgroundImageSource == null
                            ? Placeholder(
                                color:
                                    isInversed ? Colors.white : Colors.blueGrey)
                            : Hero(
                                tag: projectMetadata.title + 'image',
                                child: Image.network(
                                  projectMetadata.backgroundImageSource,
                                  fit: BoxFit.fitHeight,
                                  loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress
                                                    .expectedTotalBytes !=
                                                null
                                            ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                loadingProgress
                                                    .expectedTotalBytes
                                            : null,
                                      ),
                                    );
                                  },
                                ),
                              ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(50.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            //mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Spacer(),
                              FittedBox(
                                  child: Text(
                                "#" + projectMetadata.title,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFc34372)),
                              )),
                              FittedBox(
                                child: Text(
                                  "— " + projectMetadata.shortDescription,
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: isInversed
                                    ? const EdgeInsets.only(left: 0, right: 100)
                                    : const EdgeInsets.only(
                                        left: 100, right: 0),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                        flex: 8,
                                        child: FittedBox(
                                            child: Text('View work'))),
                                    Spacer(),
                                    Expanded(
                                      flex: isLandscape ? 2 : 4,
                                      child: FloatingActionButton(
                                        heroTag: projectMetadata.title,
                                        backgroundColor: Color(0xFFc34372),
                                        onPressed: () {},
                                        child: FittedBox(
                                          child: Icon(
                                            Icons.play_arrow,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                ProjectDetails(projectMetadata: projectMetadata,)
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).maybePop();
            },
            color: Colors.white54,
            icon: Icon(Icons.arrow_back_rounded),
            iconSize: 100,
          ),
        ],
      ),
    );
  }
}


class ProjectInfoBar extends StatelessWidget {
  final ProjectMetadata project;
  const ProjectInfoBar({this.project});

  @override
  Widget build(BuildContext context) {
    String title = project.title;
    return Row(
      children: [
        Spacer(),
        Expanded(child: Text('Name:\n$title')),
        Expanded(child: Text('Name:\n$title')),
        Expanded(child: Text('Name:\n$title')),
        Spacer()
      ],
    );
  }
}
