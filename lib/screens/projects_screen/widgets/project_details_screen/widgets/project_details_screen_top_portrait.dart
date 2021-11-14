import 'package:flutter/material.dart';
import 'package:portfolio/screens/projects_screen/models/project.dart';
import 'package:portfolio/screens/projects_screen/widgets/project_details_screen/widgets/project_details.dart';

class ProjectDetailsScreenTopPotrait extends StatelessWidget {
  const ProjectDetailsScreenTopPotrait(
      { @required this.projectMetadata});
  final ProjectMetadata projectMetadata;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Material(
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: screenHeight * 0.25,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(projectMetadata.title),
              background: Hero(
                tag: projectMetadata.title + 'image',
                child: projectMetadata.backgroundImageSource == null
                    ? Placeholder()
                    : Image.network(
                        projectMetadata.backgroundImageSource,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
          ),
          SliverFillRemaining(hasScrollBody: false, child: ProjectDetails(projectMetadata: projectMetadata,)),
        ],
      ),
    );
  }
}
