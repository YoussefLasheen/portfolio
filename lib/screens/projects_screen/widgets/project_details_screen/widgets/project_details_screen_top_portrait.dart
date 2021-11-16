import 'package:flutter/material.dart';
import 'package:portfolio/screens/projects_screen/models/project.dart';
import 'package:portfolio/screens/projects_screen/widgets/project_details_screen/widgets/project_details.dart';

class  ProjectDetailsScreenTopPotrait extends StatelessWidget {
  const ProjectDetailsScreenTopPotrait({@required this.projectDescription});
  final ProjectDescription projectDescription;

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
              title: Text(projectDescription.projectMetadata.title),
              background: Hero(
                tag: projectDescription.projectMetadata.title + 'image',
                child: projectDescription.projectMetadata.backgroundImageSource == null
                    ? Placeholder()
                    : Image.network(
                        projectDescription.projectMetadata.backgroundImageSource,
                        fit: BoxFit.cover,
                      ),
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
