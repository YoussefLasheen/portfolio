import 'package:flutter/material.dart';
import 'package:portfolio/screens/projects_screen/models/project.dart';
import 'package:portfolio/screens/projects_screen/widgets/project_card.dart';

import 'widgets/bottom_section.dart';
import 'widgets/top_section.dart';

import 'package:portfolio/services/api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
        future: Future.delayed(const Duration(milliseconds: 500000,), (){return Api('Data').getDocumentById('projects_screen');}),
        builder: (context, snapshot) {
          List projects;
          if (!snapshot.hasData) {
            projects = [
              {
                'title': 'Loading',
                'subTitle': 'Loading',
                'imgSrc': null,
                'projectDetails': {'title': 'Loading', 'body': 'Loading'},
              }
            ];
          } else {
            projects = snapshot.data['projects'];
          }
          return ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: projects.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return TopSection();
              }
              /* else if (index == projects.length + 1) {
                return BottomSection();
              }
              */
              index = index - 1;
              return ProjectCard(
                project: Project(
                    title: projects[index]['title'],
                    subTitle: projects[index]['subTitle'],
                    imgSrc: projects[index]['imgSrc'],
                    details: projects[index]['projectDetails']),
                isInversed: index.isEven,
              );
            },
          );
        });
  }
}
