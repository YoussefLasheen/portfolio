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
                  child: Row(
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
                          padding: const EdgeInsets.symmetric(horizontal: 100),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            //mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Spacer(flex: 2,),
                              Expanded(
                                child: FittedBox(
                                    child: Text(
                                  "#" + projectMetadata.title,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFc34372)),
                                )),
                              ),
                              Expanded(
                                child: FittedBox(
                                  child: Text(
                                    "— " + projectMetadata.shortDescription,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  for (var tag in projectMetadata.tags)
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Chip(label: Text(tag)),
                                    )
                                ],
                              ),
                              Spacer(flex: 4,),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                ProjectDetails(
                  projectMetadata: projectMetadata,
                )
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
