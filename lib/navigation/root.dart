import 'package:flutter/material.dart';
import 'package:portfolio/navigation/widgets/sidebar.dart';
import 'package:portfolio/screens/about_screen.dart';
import 'package:portfolio/screens/contact_screen/contact_screen.dart';
import 'package:portfolio/screens/projects_screen/projects_screen.dart';

class Root extends StatelessWidget {
  final PageController controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Material(
      child: Flex(
        direction: isLandscape? Axis.horizontal:Axis.vertical,
        children: <Widget>[
          Sidebar(
            control: controller,
          ),
          Expanded(
            child: PageView(
              controller: controller,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: isLandscape? Axis.vertical:Axis.horizontal,
              children: <Widget>[
                AboutScreen(),
                ProjectsScreen(),
                ContactScreen()
              ],
            ),
          )
        ],
      ),
    );
  }
}
