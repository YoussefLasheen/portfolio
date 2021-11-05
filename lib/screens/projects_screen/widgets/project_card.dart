import 'package:flutter/material.dart';
import 'package:portfolio/screens/projects_screen/models/project.dart';

import 'project_details_screen/project_details_screen.dart';

class ProjectCard extends StatelessWidget {
  final Project project;
  final bool isInversed;

  const ProjectCard({Key key, this.project, this.isInversed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Padding(
      padding: EdgeInsets.only(bottom: screenHeight * 0.1),
      child: Align(
        alignment: isLandscape
            ? isInversed
                ? Alignment.centerLeft
                : Alignment.centerRight
            : Alignment.center,
        child: SizedBox(
          width: isLandscape ? screenWidth * 0.7 : screenWidth * 0.9,
          child: AspectRatio(
            aspectRatio: 3 / 2,
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    //top: isLandscape ? 0 : 10,
                    right: isLandscape
                        ? isInversed
                            ? screenWidth * 0.1
                            : 0
                        : 0,
                    left: isLandscape
                        ? !isInversed
                            ? screenWidth * 0.1
                            : 0
                        : 0,
                    //bottom: isLandscape ? 0 : 10
                  ),
                  child: project.imgSrc == null
                      ? Placeholder(
                          color: isInversed ? Colors.white : Colors.blueGrey)
                      : Hero(
                          tag: project.title + 'image',
                          child: Image.network(
                            project.imgSrc,
                            fit: BoxFit.fill,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes
                                      : null,
                                ),
                              );
                            },
                          ),
                        ),
                ),
                Positioned.fill(
                  left: !isInversed ? 0 : null,
                  right: isInversed ? 0 : null,
                  child: SizedBox(
                    width: isLandscape ? screenWidth / 4 : screenWidth / 2,
                    child: Column(
                      children: <Widget>[
                        isLandscape
                            ? Spacer(
                                flex: 2,
                              )
                            : Container(),
                        Expanded(
                          flex: 2,
                          child: FittedBox(
                              child: Text(
                            "#" + project.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFc34372)),
                          )),
                        ),
                        Expanded(
                          child: FittedBox(
                              child: Text(
                            "— " + project.subTitle,
                          )),
                        ),
                        Spacer(
                          flex: isLandscape ? 5 : 8,
                        ),
                        Expanded(
                            flex: 2,
                            child: Align(
                              alignment: isInversed
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              child: FractionallySizedBox(
                                widthFactor: 3 / 4,
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
                                        heroTag: project.title,
                                        backgroundColor: Color(0xFFc34372),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ProjectDetailsScreen(
                                                project: project,
                                                isInversed: isInversed,
                                              ),
                                            ),
                                          );
                                        },
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
                            )),
                        isLandscape
                            ? Spacer(
                                flex: 8,
                              )
                            : Container(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
