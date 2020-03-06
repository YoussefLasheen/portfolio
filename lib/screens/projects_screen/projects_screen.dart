import 'package:flutter/material.dart';
import 'package:portfolio/screens/projects_screen/models/project.dart';
import 'package:portfolio/screens/projects_screen/widgets/project_card.dart';

import 'widgets/bottom_section.dart';
import 'widgets/top_section.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        return SizedBox(
          height: MediaQuery.of(context).size.height * (1 / 3) +
              (projects.length * 100),
          child: Column(
            children: <Widget>[
              if (index.isEven) ...[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 100),
                    child: ProjectCard(
                      project: projects[index],
                      isInversed: true,
                    ),
                  ),
                )
              ] else
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 100),
                    child: ProjectCard(
                      project: projects[index],
                      isInversed: false,
                    ),
                  ),
                )
            ],
          ),
        );
      },
    );
  }
}

List<Project> projects = [
  Project(title: 'doze', subTitle: 'Complete Project'),
  Project(title: 'CURRENT', subTitle: 'Complete Project'),
  Project(title: 'flurry_navigation', subTitle: 'Flutter package'),
  Project(title: 'This portfolio', subTitle: 'Complete Project'),
];
