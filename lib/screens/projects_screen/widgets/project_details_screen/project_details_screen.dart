import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:portfolio/screens/projects_screen/models/project.dart';

import 'package:portfolio/screens/projects_screen/widgets/project_details_screen/widgets/access_options.dart';
import 'package:portfolio/screens/projects_screen/widgets/project_details_screen/widgets/project_details_screen_top_landscape.dart';
import 'package:portfolio/screens/projects_screen/widgets/project_details_screen/widgets/project_details_screen_top_portrait.dart';

import 'package:portfolio/services/api.dart';

class ProjectDetailsScreen extends StatelessWidget {
  const ProjectDetailsScreen({this.isInversed, @PathParam() this.id});

  final bool? isInversed;
  final String? id;

  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return FutureBuilder<DocumentSnapshot>(
      future: Future.delayed(
        const Duration(
          milliseconds: 350,
        ),
        () {
          return Api('Data/projects_screen/projects').getDocumentById(id);
        },
      ),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(
              "Something went wrong",
              style: Theme.of(context).textTheme.headline2,
            ),
          );
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Center(
            child: Text(
              "404\nProject not found",
              style: Theme.of(context).textTheme.headline2,
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;

          ProjectDescription projectDescription = ProjectDescription(
            infoSnippet: data['infoSnippet'],
            projectMetadata: ProjectMetadata(
              title: data['metadata']['title'],
              id: data['metadata']['id'],
              shortDescription: data['metadata']['shortDescription'],
              tags: data['metadata']['tags'],
              backgroundImageSource: data['metadata']['backgroundImageSource'],
            ),
            accessOptions: data['accessOptions'],
          );
          if (isLandscape) {
            return ProjectDetailsScreenTopLandscape(
              isInversed: isInversed ?? true,
              projectDescription: projectDescription,
            );
          } else {
            return Stack(
              children: [
                ProjectDetailsScreenTopPotrait(
                  projectDescription: projectDescription,
                ),
                AccessOptions(
                  accessOptions: projectDescription.accessOptions,
                ),
              ],
            );
          }
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
