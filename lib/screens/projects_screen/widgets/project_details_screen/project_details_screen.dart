import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/assets/constants.dart';

import 'package:portfolio/screens/projects_screen/models/project.dart';

import 'package:portfolio/screens/projects_screen/widgets/project_details_screen/widgets/access_options.dart';
import 'package:portfolio/screens/projects_screen/widgets/project_details_screen/widgets/project_details_screen_top_landscape.dart';
import 'package:portfolio/screens/projects_screen/widgets/project_details_screen/widgets/project_details_screen_top_portrait.dart';

import 'package:portfolio/services/api.dart';
import 'package:shimmer/shimmer.dart';

class ProjectDetailsScreen extends StatelessWidget {
  const ProjectDetailsScreen({this.isInversed, this.id, this.project});

  final Project? project;
  final bool? isInversed;
  final String? id;

  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return FutureBuilder(
      future: project != null
          ? Future.delayed(
              const Duration(
                milliseconds: 350,
              ),
              () => Future.value(project),
            )
          : Api('Data').getDocumentById('projects_screen'),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData) {
          Project? _project;
          if (project != null) {
            _project = project;
          } else {
            Map<String, dynamic> data = (snapshot.data as DocumentSnapshot)
                .data() as Map<String, dynamic>;
            _project = Project.fromJson((data['projects'] as Map).entries
                .firstWhere((element) => element.key == id).value,id!);
          }

          if (isLandscape) {
            return ProjectDetailsScreenTopLandscape(
              isInversed: isInversed ?? true,
              projectDescription: _project!,
            );
          } else {
            return Stack(
              children: [
                ProjectDetailsScreenTopPotrait(
                  projectDescription: _project!,
                ),
                AccessOptions(
                  accessOptions: _project.accessOptions,
                ),
              ],
            );
          }
        }
        return isLandscape
            ? ProjectDetailsLoadingShimmerLandscape()
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}

class ProjectDetailsLoadingShimmerLandscape extends StatelessWidget {
  const ProjectDetailsLoadingShimmerLandscape({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Shimmer(
      gradient: shimmerGradient,
      period: Duration(seconds: 1),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(
                    flex: 2,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Wrap(
                    alignment: WrapAlignment.end,
                    children: [
                      for (var i = 0; i < 2; i++)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Chip(
                              label: SizedBox(
                            width: 50,
                          )),
                        )
                    ],
                  ),
                  Spacer(
                    flex: 3,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      height: screenHeight * 0.1,
                      child: Container(color: Colors.white),
                    ),
                  ),
                  Spacer()
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
