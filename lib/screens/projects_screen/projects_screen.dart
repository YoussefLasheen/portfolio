import 'package:flutter/material.dart';
import 'package:portfolio/screens/projects_screen/models/project.dart';
import 'package:portfolio/screens/projects_screen/widgets/project_card.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: projects.length + 2,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: Column(
              children: <Widget>[
                Spacer(flex: 2),
                Expanded(
                  flex: 2,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              flex: 4,
                              child: FittedBox(
                                child: Text(
                                  '#Recent Work',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Spacer(),
                            Expanded(
                              flex: 6,
                              child: FittedBox(
                                child: Text(
                                  'Some of my projects. From complete\nprojects with showcases to Flutter packages',
                                  style: TextStyle(color: Colors.white70),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(
                        flex: 2,
                      ),
                      Expanded(
                          flex: 2,
                          child: Image.asset('assets/images/P2Logo.png')),
                      Spacer()
                    ],
                  ),
                ),
                Spacer(flex: 2)
              ],
            ),
          );
        } else if (index == projects.length + 1) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * (4 / 3),
            child: Stack(
              children: <Widget>[
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Image.asset('assets/images/rect1208-0-8.png'),
                ),
                /*
                Padding(
                  padding: const EdgeInsets.only(top: 150),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                        color: Color(0xFFc34372),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(500),
                            topRight: Radius.circular(500))),
                  ),
                ),
                */
                Center(
                  child: FractionallySizedBox(
                    widthFactor: 2 / 3,
                    child: Column(
                      children: <Widget>[
                        Spacer(
                          flex: 2,
                        ),
                        Expanded(
                          flex: 6,
                          child: Image.asset(
                              'assets/images/P2-BottonSection-Background.png'),
                        ),
                        Spacer(),
                        Expanded(
                          flex: 6,
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                flex: 2,
                                child: FittedBox(
                                  child: Text("Have an intersting project?"),
                                ),
                              ),
                              Expanded(
                                child: FittedBox(
                                  child: Text(
                                    "No matter what it is you're after, contact me today to discuss further",
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white70),
                                  ),
                                ),
                              ),
                              Spacer(),
                              Expanded(
                                flex: 1,
                                child: Center(
                                  child: FractionallySizedBox(
                                    widthFactor: 5 / 12,
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 3,
                                          child: SizedBox.expand(
                                            child: TextField(
                                              style: TextStyle(
                                                  color: Colors.black87),
                                              decoration: new InputDecoration(
                                                  border:
                                                      new OutlineInputBorder(
                                                    borderSide: BorderSide.none,
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          const Radius.circular(
                                                              50.0),
                                                      bottomLeft:
                                                          const Radius.circular(
                                                              50.0),
                                                    ),
                                                  ),
                                                  filled: true,
                                                  hintStyle: new TextStyle(
                                                      color: Colors.grey[800]),
                                                  hintText: "Your Email",
                                                  fillColor: Colors.white),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: SizedBox.expand(
                                            child: FlatButton(
                                              onPressed: () {},
                                              color: Colors.cyan,
                                              child: Text(
                                                "GO",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  bottomRight:
                                                      const Radius.circular(
                                                          50.0),
                                                  topRight:
                                                      const Radius.circular(
                                                          50.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Spacer()
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        index = index - 1;
        return SizedBox(
          height: MediaQuery.of(context).size.height * (1 / 3) +
              (projects.length * 100),
          child: Column(
            children: <Widget>[
              if (index.isEven) ...[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 100),
                    child: ProjectCard(
                      project: projects[index],
                      isInversed: true,
                    ),
                  ),
                )
              ] else
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 100),
                    child: ProjectCard(
                      project: projects[index],
                      isInversed: false,
                    ),
                  ),
                )
            ],
          ),
        );
      },
    );
  }
}

List<Project> projects = [
  Project(title: 'doze', subTitle: 'Complete Project'),
  Project(title: 'CURRENT', subTitle: 'Complete Project'),
  Project(title: 'flurry_navigation', subTitle: 'Flutter package'),
  Project(title: 'This portfolio', subTitle: 'Complete Project'),
];
