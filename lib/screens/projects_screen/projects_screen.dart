import 'package:flutter/material.dart';
import 'package:portfolio/assets/constants.dart';
import 'package:portfolio/screens/projects_screen/models/project.dart';
import 'package:portfolio/screens/projects_screen/widgets/project_card.dart';

import 'widgets/top_section.dart';

import 'package:portfolio/services/api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProjectsScreen extends StatelessWidget {
  final String? queryTag;

  const ProjectsScreen({Key? key, this.queryTag}) : super(key: key);
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

          List<Project> myModels = (data['projectsIndex'] as List)
              .map((i) => Project.fromJson(i))
              .toList();

          return AnimatedFilteredList(
            projectsIndex: myModels,
            allTags: data['allTags'],
            queryTag: queryTag ?? "",
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}

class AnimatedFilteredList extends StatefulWidget {
  final List? allTags;
  final String queryTag;
  const AnimatedFilteredList({
    Key? key,
    required this.projectsIndex,
    this.allTags,
    this.queryTag = "",
  }) : super(key: key);

  final List<Project> projectsIndex;

  @override
  State<AnimatedFilteredList> createState() => _AnimatedFilteredListState();
}

class _AnimatedFilteredListState extends State<AnimatedFilteredList> {
  String? filterTag = "All";
  ViewOption viewOption = ViewOption.list;
  List<Project>? filteredProjects;

  @override
  void initState() {
    if (widget.queryTag.isNotEmpty &&
        widget.allTags!.contains(widget.queryTag)) {
      filterTag = widget.queryTag;
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    filteredProjects = widget.projectsIndex.where((element) {
      if (filterTag == "All") return true;
      return element.tags!.contains(filterTag);
    }).toList();

    bool isVertical =
        MediaQuery.of(context).orientation == Orientation.portrait;
    if (isVertical) viewOption = ViewOption.list;
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        TopSection(),
        Row(
          children: [
            ChoiceTags(
              allTags: widget.allTags,
              filterTag: filterTag,
              onSelected: (tag) {
                setState(() {
                  filterTag = tag;
                });
              },
            ),
            Spacer(),
            if (!isVertical)
              Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: ToggleButtons(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  selectedColor: Colors.white,
                  fillColor: mainColor,
                  isSelected: [
                    viewOption == ViewOption.list,
                    viewOption == ViewOption.grid
                  ],
                  onPressed: (int index) {
                    if (index == 0) {
                      setState(() {
                        viewOption = ViewOption.list;
                      });
                    } else {
                      setState(() {
                        viewOption = ViewOption.grid;
                      });
                    }
                  },
                  children: const <Widget>[
                    Icon(Icons.list_alt_outlined),
                    Icon(Icons.grid_view_rounded),
                  ],
                ),
              ),
          ],
        ),
        if (viewOption == ViewOption.list)
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: filteredProjects!.length,
            itemBuilder: (context, index) {
              Project _project = filteredProjects![index];
              return ProjectCard(
                project: _project,
                isInversed: index.isEven,
                id: _project.id,
              );
            },
          ),
        if (viewOption == ViewOption.grid)
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.5,
            ),
            itemCount: filteredProjects!.length,
            itemBuilder: (context, index) {
              Project _project = filteredProjects![index];
              return ProjectCard(
                project: _project,
                isInversed: true,
                id: _project.id,
              );
            },
          )
      ],
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

enum ViewOption { list, grid }
