import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/routes/router.gr.dart';
import 'package:portfolio/screens/about_screen/sections/welcome_section.dart';
import 'package:portfolio/screens/projects_screen/models/project.dart';

class ProjectCard extends StatelessWidget {
  final ProjectMetadata projectMetadata;
  final String id;
  final bool isInversed;

  const ProjectCard({this.projectMetadata, this.isInversed, this.id});
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.05, horizontal: isLandscape ? 50 : 0),
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
                _buildBackgroundImage(isLandscape, screenWidth),
                _buildOverlayText(isLandscape, screenWidth, context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOverlayText(
      bool isLandscape, double screenWidth, BuildContext context) {
    return Positioned.fill(
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
                          blurRadius: 5)
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
              flex: 5,
            ),
            Flexible(
                flex: 3,
                child: Align(
                  alignment:
                      isInversed ? Alignment.centerRight : Alignment.centerLeft,
                  child: FractionallySizedBox(
                    widthFactor: 3 / 4,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            flex: 8,
                            child: FittedBox(child: Text('View work'))),
                        Spacer(),
                        Flexible(
                          flex: isLandscape ? 4 : 4,
                          child: ColoredButton(
                            decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1)),
                            onPressed: () {
                              context.router.push(ProjectsDetailsRouter(
                                id: id,
                                isInversed: isInversed,
                              ));
                            },
                            child: FittedBox(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                  size: 50,
                                ),
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
    );
  }

  Widget _buildBackgroundImage(bool isLandscape, double screenWidth) {
    return Padding(
      padding: EdgeInsets.only(
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
      ),
      child: projectMetadata.backgroundImageSource == null
          ? Placeholder(color: isInversed ? Colors.white : Colors.blueGrey)
          : Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: Offset(2, 2),
                    blurRadius: 15)
              ]),
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
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes
                            : null,
                      ),
                    );
                  },
                ),
              ),
            ),
    );
  }
}
