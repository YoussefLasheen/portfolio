import 'package:flutter/material.dart';
import 'package:portfolio/screens/projects_screen/models/project.dart';

class ProjectDetails extends StatelessWidget {
  const ProjectDetails({Key key, this.project}) : super(key: key);
  final Project project;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: screenHeight * 0.25,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(project.title),
              background: Hero(
                tag: project.title + 'image',
                child: Image.network(
                  project.imgSrc,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverFillRemaining(
              child: Text("data"),
            ),
        ],
      ),
    );
  }
}
