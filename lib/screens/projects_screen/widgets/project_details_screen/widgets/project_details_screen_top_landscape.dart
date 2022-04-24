import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/assets/constants.dart';
import 'package:portfolio/screens/projects_screen/models/project.dart';
import 'package:portfolio/screens/projects_screen/widgets/project_details_screen/widgets/access_options.dart';
import 'package:portfolio/screens/projects_screen/widgets/project_details_screen/widgets/project_details.dart';
import 'package:portfolio/screens/shared_components/blend_mask.dart';
import 'package:seo_renderer/seo_renderer.dart';

class ProjectDetailsScreenTopLandscape extends StatelessWidget {
  const ProjectDetailsScreenTopLandscape({
    required this.projectDescription,
    this.isInversed = true,
  });
  final ProjectDescription projectDescription;
  final bool isInversed;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
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
                      child:Image.network(
                        projectDescription.projectMetadata!.backgroundImageSource!,
                        fit: BoxFit.fitHeight,
                        loadingBuilder: (BuildContext context,
                            Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress
                                          .expectedTotalBytes !=
                                      null
                                  ? loadingProgress
                                          .cumulativeBytesLoaded /
                                      loadingProgress
                                          .expectedTotalBytes!
                                  : null,
                            ),
                          );
                        },
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
                                  child: TextRenderer(
                                    child: Text(
                                "#" + projectDescription.projectMetadata!.title!,
                                style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: mainColor),
                              ),
                                  )),
                            ),
                            Expanded(
                              child: FittedBox(
                                child: TextRenderer(
                                  child: Text(
                                    "— " + projectDescription.projectMetadata!.shortDescription!,
                                  ),
                                ),
                              ),
                            ),
                            Wrap(
                              alignment:WrapAlignment.end,
                              children: [
                                for (var tag in projectDescription.projectMetadata!.tags!)
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Chip(label: Text(tag)),
                                  )
                              ],
                            ),
                            Spacer(flex: 3,),
                            AccessOptions(accessOptions: projectDescription.accessOptions,),
                            Spacer()
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              ProjectDetails(
                projectDescription: projectDescription,
              )
            ],
          ),
        ),
        IconButton(
          onPressed: () {
            context.router.navigateNamed('');
          },
          color: Colors.white,
          icon: BlendMask(
            blendMode: BlendMode.difference,
            child: Icon(Icons.arrow_back_rounded),
          ),
          iconSize: 100,
        ),
      ],
    );
  }
}
