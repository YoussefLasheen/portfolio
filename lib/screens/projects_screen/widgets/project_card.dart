import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mouse_parallax/mouse_parallax.dart';
import 'package:portfolio/assets/constants.dart';
import 'package:portfolio/routes/router.gr.dart';
import 'package:portfolio/screens/about_screen/sections/welcome_section.dart';
import 'package:portfolio/screens/projects_screen/models/project.dart';

class ProjectCard extends StatelessWidget {
  final ProjectMetadata? projectMetadata;
  final String? id;
  final bool? isInversed;

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
            ? isInversed!
                ? Alignment.centerLeft
                : Alignment.centerRight
            : Alignment.center,
        child: SizedBox(
          width: isLandscape ? screenWidth * 0.7 : screenWidth * 0.9,
          child: AspectRatio(
            aspectRatio: 3 / 2,
            child: ParallaxStack(
              layers: <Widget>[
                ParallaxLayer(
                  xOffset: 10,
                  yOffset: 5,
                  xRotation: 0.01,
                  yRotation: 0.01,
                  child: _buildBackgroundImage(isLandscape, screenWidth),
                ),
                ParallaxLayer(
                   xOffset: 5,
                   yOffset: 0,
                  child: _buildOverlayText(isLandscape, screenWidth, context),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOverlayText(
      bool isLandscape, double screenWidth, BuildContext context) {
    return Align(
      alignment: isInversed!?Alignment.centerRight:Alignment.centerLeft,
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
              child: Align(
                alignment: Alignment.centerLeft,
                child: FittedBox(
                  child: Text(
                    "#" + projectMetadata!.title!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: mainColor,
                      fontSize: 50,
                      shadows: [
                        Shadow(
                            color: Colors.black.withOpacity(0.3),
                            offset: Offset(2, 2),
                            blurRadius: 5)
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: FittedBox(
                  child: Text(
                    "— " + projectMetadata!.shortDescription!,
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
            ),
            Spacer(
              flex: 5,
            ),
            Flexible(
                flex: 3,
                child: Align(
                  alignment:
                      isInversed! ? Alignment.centerRight : Alignment.centerLeft,
                  child: FractionallySizedBox(
                    widthFactor: 3 / 4,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 8,
                          child: FittedBox(
                            child: Text(
                              'VIEW WORK',
                              maxLines: 1,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                        Flexible(
                          flex: isLandscape ? 4 : 4,
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: ColoredButton(
                              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1)),
                              onPressed: () {
                                context.router.push(ProjectsDetailsRouter(
                                  id: id!,
                                  isInversed: isInversed!,
                                ));
                              },
                              child: Center(
                                child: FittedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Icon(
                                      Icons.open_in_new,
                                      color: Colors.white,
                                      size: 50,
                                    ),
                                  ),
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
            ? isInversed!
                ? screenWidth * 0.1
                : 0
            : 0,
        left: isLandscape
            ? !isInversed!
                ? screenWidth * 0.1
                : 0
            : 0,
      ),
      child: projectMetadata!.backgroundImageSource == null
          ? Placeholder(color: isInversed! ? Colors.white : Colors.blueGrey)
          : Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: Offset(2, 2),
                    blurRadius: 15)
              ]),
              child: Hero(
                tag: projectMetadata!.title! + 'image',
                child: Image.network(
                  projectMetadata!.backgroundImageSource!,
                  fit: BoxFit.fill,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
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
