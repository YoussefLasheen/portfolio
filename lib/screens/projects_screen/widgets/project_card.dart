import 'package:flutter/material.dart';
import 'package:portfolio/screens/projects_screen/models/project.dart';

class ProjectCard extends StatelessWidget {
  final Project project;
  final bool isInversed;

  const ProjectCard({Key key, this.project, this.isInversed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: isInversed ? Alignment.centerLeft : Alignment.centerRight,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * (9 / 16),
            child:
                Placeholder(color: isInversed ? Colors.white : Colors.blueGrey),
          ),
        ),
        Positioned(
            width: MediaQuery.of(context).size.width / 4,
            height: MediaQuery.of(context).size.height * (2 / 3),
            left: !isInversed?MediaQuery.of(context).size.width / 5:null,
            right: isInversed?MediaQuery.of(context).size.width / 5:null,
            child: Column(
              children: <Widget>[
                Spacer(
                  flex: 2,
                ),
                Expanded(
                  flex: 2,
                  child: FittedBox(
                      child: Text(
                    "# " + project.title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xFFc34372)),
                  )),
                ),
                Expanded(
                  child: FittedBox(
                      child: Text("— " + project.subTitle,)),
                ),
                Spacer(
                  flex: 5,
                ),
                Expanded(
                    flex: 2,
                    child: Align(
                      alignment: isInversed?Alignment.centerRight:Alignment.centerLeft,
                      child: FractionallySizedBox(
                        widthFactor: 3/4,
                        child: Row(
                          children: <Widget>[
                            Expanded(child: FittedBox(child: Text('View work'))),
                            FloatingActionButton(
                              backgroundColor: Color(0xFFc34372),
                              onPressed: (){},
                              child: Icon(Icons.play_arrow, color: Colors.white,),
                            ),
                          ],
                        ),
                      ),
                    )),
                Spacer(
                  flex: 8,
                )
              ],
            ))
      ],
    );
  }
}
