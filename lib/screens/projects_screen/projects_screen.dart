import 'package:flutter/material.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:implicitly_animated_reorderable_list/transitions.dart';
import 'package:portfolio/screens/projects_screen/models/project.dart';
import 'package:portfolio/screens/projects_screen/widgets/project_card.dart';

import 'widgets/top_section.dart';

import 'package:portfolio/services/api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProjectsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: Api('Data').getDocumentById('projects_screen'),
      builder: (context, snapshot) {
        bool hasData = snapshot.hasData;
        return AnimatedFilteredList(
            projectsIndex: hasData?snapshot.data['projectsIndex']:[],
            allTags: hasData?snapshot.data['allTags']:[]);
      },
    );
  }
}

class AnimatedFilteredList extends StatefulWidget {
  final List allTags;
  const AnimatedFilteredList({
    Key key,
    @required this.projectsIndex,
    this.allTags,
  }) : super(key: key);

  final List projectsIndex;

  @override
  State<AnimatedFilteredList> createState() => _AnimatedFilteredListState();
}

class _AnimatedFilteredListState extends State<AnimatedFilteredList> {
  String filterTag = "All";

  @override
  Widget build(BuildContext context) {
    List filteredIndex = [];

    if (filterTag == "All") {
      filteredIndex
        ..clear()
        ..addAll(widget.projectsIndex);
    } else {
      for (int i = 0; i < widget.projectsIndex.length; i++) {
        for (int h = 0; h < widget.projectsIndex[i]['tags'].length; h++) {
          if (filterTag.contains(widget.projectsIndex[i]['tags'][h])) {
            filteredIndex.add(widget.projectsIndex[i]);
            setState(() {
            });
            break;
          }
        }
      }
    }

    return ListView(
      physics: BouncingScrollPhysics(),
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
        ImplicitlyAnimatedList<dynamic>(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          items: filteredIndex,
          areItemsTheSame: (a, b) => a['id'] == b['id'],
          itemBuilder: (context, animation, filteredProjectMetadata, index) {
            // check for out of bounds index because of a bug in the ImplicitlyAnimatedList widget
            if (index >= filteredIndex.length) return Container();
            return SizeFadeTransition(
              sizeFraction: 0.7,
              curve: Curves.easeInOut,
              animation: animation,
              child: _buildCard(filteredProjectMetadata, index.isEven),
            );
          },
        ),
      ],
    );
  }
}

Widget _buildCard(Map project, bool isInversed) {
  return ProjectCard(
    id: project['id'],
    projectMetadata: ProjectMetadata(
      title: project['title'],
      shortDescription: project['shortDescription'],
      backgroundImageSource: project['backgroundImageSource'],
      tags: project['tags'],
      id: project['id'],
    ),
    isInversed: isInversed,
  );
}

class ChoiceTags extends StatelessWidget {
  final Function onSelected;
  final String filterTag;
  final List allTags;

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
                    selectedColor: Color(0xFFc34372),
                    label: Text(
                      "All",
                      style: TextStyle(color: Colors.white),
                    ),
                    selected: filterTag.contains("All"),
                    onSelected: (_) => onSelected("All")),
              ),
              for (var tag in allTags)
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ChoiceChip(
                      selectedColor: Color(0xFFc34372),
                      label: Text(
                        tag,
                        style: TextStyle(color: Colors.white),
                      ),
                      selected: filterTag.contains(tag),
                      onSelected: (_) => onSelected(tag)),
                )
            ],
          ),
        ),
      ),
    );
  }
}
