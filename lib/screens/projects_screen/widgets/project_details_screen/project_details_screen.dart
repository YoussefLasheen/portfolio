import 'package:flutter/widgets.dart';

import 'package:portfolio/screens/projects_screen/models/project.dart';

import 'package:portfolio/screens/projects_screen/widgets/project_details_screen/widgets/project_details_screen_top_landscape.dart';
import 'package:portfolio/screens/projects_screen/widgets/project_details_screen/widgets/project_details_screen_top_portrait.dart';


class ProjectDetailsScreen extends StatelessWidget {
  const ProjectDetailsScreen({this.isInversed, @PathParam() this.id});

  final ProjectMetadata projectMetadata;
  final bool isInversed;
  final String id;

  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    if (isLandscape) {
      return ProjectDetailsScreenTopLandscape(
            isInversed: isInversed,
            projectMetadata: projectMetadata,

          );
    } else {
      return ProjectDetailsScreenTopPotrait(
            projectMetadata: projectMetadata,
          );
    }
  }
}


