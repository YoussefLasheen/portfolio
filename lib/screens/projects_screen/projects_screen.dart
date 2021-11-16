import 'package:flutter/material.dart';
import 'package:portfolio/screens/projects_screen/models/project.dart';
import 'package:portfolio/screens/projects_screen/widgets/project_card.dart';

import 'widgets/bottom_section.dart';
import 'widgets/top_section.dart';

import 'package:portfolio/services/api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProjectsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: Future.delayed(
          const Duration(
            milliseconds: 350,
          ), () {
        return Api('Data').getDocumentById('projects_screen');
      }),
      builder: (context, snapshot) {
        List projectsIndex;
        if (!snapshot.hasData) {
          projectsIndex = [
            {
              'title': 'Loading',
              'shortDescription': 'Loading',
              'backgroundImageSource': null,
              'id': 's',
              'tags': []
            }
          ];
        } else {
          projectsIndex = snapshot.data['projectsIndex'];
        }

        return ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: projectsIndex.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return TopSection();
            }
            index = index - 1;
            return ProjectCard(
              id: projectsIndex[index]['id'],
              projectMetadata: ProjectMetadata(
                title: projectsIndex[index]['title'],
                shortDescription: projectsIndex[index]['shortDescription'],
                backgroundImageSource: projectsIndex[index]
                    ['backgroundImageSource'],
                tags: projectsIndex[index]['tags'],
                id: projectsIndex[index]['id'],
              ),
              isInversed: index.isEven,
            );
          },
        );
      },
    );
  }
}
