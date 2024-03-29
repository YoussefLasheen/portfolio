import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/screens/projects_screen/models/project.dart';
import 'package:portfolio/screens/projects_screen/widgets/project_details_screen/widgets/project_details.dart';

class  ProjectDetailsScreenTopPotrait extends StatelessWidget {
  const ProjectDetailsScreenTopPotrait({required this.projectDescription});
  final Project projectDescription;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Material(
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            leading: IconButton(onPressed: (){context.go('/projects');}, icon: Icon(Icons.arrow_back_rounded)),
            expandedHeight: screenHeight * 0.25,
            bottom: PreferredSize(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    for (var tag in projectDescription.tags!)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Chip(label: Text(tag)),
                      )
                  ],
                ),
                preferredSize: Size.fromHeight(50)),
            actions: [],
            flexibleSpace: FlexibleSpaceBar(
              title: Text(projectDescription.title!),
              background: projectDescription.backgroundImageSource == null
                  ? Placeholder()
                  : Image.network(
                      projectDescription.backgroundImageSource!,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: ProjectDetails(
              projectDescription: projectDescription,
            ),
          ),
        ],
      ),
    );
  }
}
