import 'package:auto_route/auto_route.dart';
import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/routes/router.gr.dart';
import 'package:portfolio/screens/projects_screen/models/project.dart';

import 'project_details_screen/project_details_screen.dart';

class ProjectCard extends StatelessWidget {
  final ProjectMetadata projectMetadata;
  final String id;
  final bool isInversed;

  const ProjectCard({Key key, this.projectMetadata, this.isInversed, this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.05, horizontal: isLandscape? 50:0),
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
                  child: projectMetadata.backgroundImageSource == null
                      ? Placeholder(
                          color: isInversed ? Colors.white : Colors.blueGrey)
                      : Container(
                        decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.3),
                                    offset: Offset(2, 2),
                                    blurRadius: 15)]),
                        child: Hero(
                            tag: projectMetadata.title + 'image',
                            child: Image.network(
                              projectMetadata.backgroundImageSource,
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
                            "#" + projectMetadata.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFc34372),
                                shadows: [
                                  Shadow(
                                    color: Colors.black.withOpacity(0.3),
                                    offset: Offset(2, 2),
                                    blurRadius: 5
                                  )
                                ]),
                          )),
                        ),
                        Expanded(
                          child: FittedBox(
                              child: Text(
                            "— " + projectMetadata.shortDescription,
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
                                        heroTag: projectMetadata.title,
                                        backgroundColor: Color(0xFFc34372),
                                        onPressed: () {
                                          context.router.push(
                                            ProjectsDetailsRouter(
                                              id:id,
                                              isInversed: isInversed, )
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
