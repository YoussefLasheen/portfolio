import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/assets/constants.dart';
import 'package:portfolio/screens/projects_screen/models/project.dart';
import 'package:portfolio/screens/projects_screen/widgets/project_card.dart';

import 'widgets/top_section.dart';

import 'package:portfolio/services/api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProjectsScreen extends StatelessWidget {
  final String? queryTag;

  const ProjectsScreen({Key? key, @queryParam this.queryTag}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: Api('Data').getDocumentById('projects_screen'),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          
          List<ProjectMetadata> myModels = (data['projectsIndex'] as List).map((i) =>
              ProjectMetadata.fromJson(i)).toList();
           
          return AnimatedFilteredList(
            projectsIndex: myModels,
            allTags: data['allTags'],
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}

class AnimatedFilteredList extends StatefulWidget {
  final List? allTags;  
  const AnimatedFilteredList({
    Key? key,
    required this.projectsIndex,
    this.allTags,
  }) : super(key: key);

  final List<ProjectMetadata> projectsIndex;

  @override
  State<AnimatedFilteredList> createState() => _AnimatedFilteredListState();
}

class _AnimatedFilteredListState extends State<AnimatedFilteredList> {
  String? filterTag = "All";
  
  List<ProjectMetadata>? filteredProjects;
  @override
  Widget build(BuildContext context) {
    Parameters queryTag = context.routeData.queryParams;
    if (queryTag.isNotEmpty && widget.allTags!.contains(queryTag.rawMap['tag'])) {
      filterTag = queryTag.rawMap['tag'];
    }

    filteredProjects = widget.projectsIndex.where((element) {
      if (filterTag == "All") return true;
      return element.tags!.contains(filterTag);
    }).toList();

    return ListView.builder(
      shrinkWrap: true,
      itemCount: filteredProjects!.length,
      itemBuilder: (context, index) {
        ProjectMetadata _project = filteredProjects![index];
        if (index != 0)
         return ProjectCard(
            projectMetadata: _project,
            isInversed: index.isEven,
            id: _project.id,
          );
        return Column(
          children: [
            TopSection(),
            ChoiceTags(
              allTags: widget.allTags,
              filterTag: filterTag,
              onSelected: (tag) {
                setState(() {
                  filterTag = tag;
                });
              },
            ),
            ProjectCard(
              projectMetadata: _project,
              isInversed: index.isEven,
              id: _project.id,
            ),
          ],
        );
      },
    );
  }
}

class ChoiceTags extends StatelessWidget {
  final Function? onSelected;
  final String? filterTag;
  final List? allTags;

  const ChoiceTags({this.onSelected, this.filterTag, this.allTags});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ChoiceChip(
                    selectedColor: mainColor,
                    label: Text(
                      "All",
                      style: TextStyle(color: Colors.white),
                    ),
                    selected: filterTag!.contains("All"),
                    onSelected: (_) => onSelected!("All")),
              ),
              for (var tag in allTags!)
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ChoiceChip(
                      selectedColor: mainColor,
                      label: Text(
                        tag,
                        style: TextStyle(color: Colors.white),
                      ),
                      selected: filterTag!.contains(tag),
                      onSelected: (_) => onSelected!(tag)),
                )
            ],
          ),
        ),
      ),
    );
  }
}
