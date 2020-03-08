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
        future: Api('Data').getDocumentById('projects_screen'),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }
          List projects = snapshot.data['projects'];
          return ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: projects.length + 2,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return TopSection();
              } else if (index == projects.length + 1) {
                return BottomSection();
              }
              index = index - 1;
              return Padding(
                padding: EdgeInsets.only(bottom: 100),
                child: ProjectCard(
                  project: Project(
                      title: projects[index]['title'],
                      subTitle: projects[index]['subTitle'],
                      imgSrc: projects[index]['imgSrc']),
                  isInversed: index.isEven,
                ),
              );
            },
          );
        });
  }
}
