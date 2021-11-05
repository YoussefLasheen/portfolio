import 'package:flutter/widgets.dart';

import 'package:portfolio/screens/projects_screen/models/project.dart';

import 'package:portfolio/screens/projects_screen/widgets/project_details_screen/widgets/project_details_screen_top_landscape.dart';
import 'package:portfolio/screens/projects_screen/widgets/project_details_screen/widgets/project_details_screen_top_portrait.dart';

import 'widgets/project_details.dart';

class ProjectDetailsScreen extends StatelessWidget {
  const ProjectDetailsScreen({this.isInversed, this.project});

  final Project project;
  final bool isInversed;

  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    String body = project.details['body'].replaceAll('<br/>', '\n');
    return isLandscape
        ? ProjectDetailsScreenTopLandscape(
            isInversed: isInversed,
            project: project,
            content: ProjectDetails(
              body: body,
            ),
          )
        : ProjectDetailsScreenTopPotrait(
            project: project,
            content: ProjectDetails(
              body: body,
            ),
          );
  }
}


