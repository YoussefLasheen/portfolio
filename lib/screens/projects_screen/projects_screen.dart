import 'package:flutter/material.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:implicitly_animated_reorderable_list/transitions.dart';
import 'package:portfolio/screens/projects_screen/models/project.dart';
import 'package:portfolio/screens/projects_screen/widgets/project_card.dart';

import 'widgets/bottom_section.dart';
import 'widgets/top_section.dart';

import 'package:portfolio/services/api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProjectsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: Future.delayed(
          const Duration(
            milliseconds: 350,
          ), () {
        return Api('Data').getDocumentById('projects_screen');
      }),
      builder: (context, snapshot) {
        List projectsIndex;
        List allTags;
        if (!snapshot.hasData) {
          projectsIndex = [
            {
              'title': 'Loading',
              'shortDescription': 'Loading',
              'backgroundImageSource': null,
              'id': 's',
              'tags': []
            }
          ];
          allTags = [''];
        } else {
          projectsIndex = snapshot.data['projectsIndex'];
          allTags = snapshot.data['allTags'];
        }

        return AnimatedFilteredList(
            projectsIndex: projectsIndex, allTags: allTags);
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
            break;
          }
        }
      }
    }

    return ListView(
      children: [
        TopSection(),
        Align(
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
                      onSelected: (s) {
                        filterTag = "All";
                        setState(() {});
                      },
                    ),
                  ),
                  for (var tag in widget.allTags)
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ChoiceChip(
                        selectedColor: Color(0xFFc34372),
                              label: Text(tag,style: TextStyle(color: Colors.white),),
                              selected: filterTag.contains(tag),
                              onSelected: (s) {
                                filterTag = tag;
                                setState(() {});
                              },
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }
        return SizeFadeTransition(
          sizeFraction: 0.7,
          curve: Curves.easeInOut,
          animation: animation,
          child: _buildCard(filteredIndex, index),
        );
      },
    );
  }
}

Widget _buildCard(List filteredIndex, int index) {
  return ProjectCard(
    id: filteredIndex[index]['id'],
    projectMetadata: ProjectMetadata(
      title: filteredIndex[index]['title'],
      shortDescription: filteredIndex[index]['shortDescription'],
      backgroundImageSource: filteredIndex[index]['backgroundImageSource'],
      tags: filteredIndex[index]['tags'],
      id: filteredIndex[index]['id'],
    ),
    isInversed: index.isEven,
  );
}
