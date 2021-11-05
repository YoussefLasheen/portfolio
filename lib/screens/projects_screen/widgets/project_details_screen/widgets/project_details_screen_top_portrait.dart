import 'package:flutter/material.dart';
import 'package:portfolio/screens/projects_screen/models/project.dart';

class ProjectDetailsScreenTopPotrait extends StatelessWidget {
  const ProjectDetailsScreenTopPotrait(
      {@required this.content, @required this.project});
  final Widget content;
  final Project project;

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
              title: Text(project.title),
              background: Hero(
                tag: project.title + 'image',
                child: project.imgSrc == null
                    ? Placeholder()
                    : Image.network(
                        project.imgSrc,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
          ),
          SliverFillRemaining(hasScrollBody: false, child: content),
        ],
      ),
    );
  }
}
