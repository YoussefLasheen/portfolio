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

    return FutureBuilder<DocumentSnapshot>(
        future: Future.delayed(
            const Duration(
              milliseconds: 350,
            ), () {
          return Api('Data/projects_screen/projects').getDocumentById(id);
        }),
        builder: (context, snapshot) {
          ProjectDescription projectDescription;
          if (!snapshot.hasData) {
            projectDescription = ProjectDescription(infoSnippet: {
              'role': 'Loading..',
              'client': 'Loading..',
              'credits': 'Loading..',
              'date': 'Loading..',
              'longDescription': 'Loading..'
            }, projectMetadata: ProjectMetadata(backgroundImageSource: null,shortDescription: '',title: '',tags: [],id: ''));
          } else {
            projectDescription = ProjectDescription(
                infoSnippet: snapshot.data['infoSnippet'],
                projectMetadata: ProjectMetadata(
                  title: snapshot.data['metadata']['title'],
                  id: snapshot.data['metadata']['id'],
                  shortDescription: snapshot.data['metadata']['shortDescription'],
                  tags: snapshot.data['metadata']['tags'],
                  backgroundImageSource: snapshot.data['metadata']['backgroundImageSource'],
                ));
          }
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


