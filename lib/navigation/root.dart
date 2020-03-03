import 'package:flutter/material.dart';
import 'package:portfolio/screens/about_screen.dart';
import 'package:portfolio/screens/contact_screen.dart';
import 'package:portfolio/screens/projects_screen.dart';

import 'widgets/pageview_indicator.dart';

class Root extends StatefulWidget {
  const Root({Key key}) : super(key: key);

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  int currentPageValue = 0;
  PageController controller = PageController(initialPage: 0);
  Color sideBarColor = Colors.transparent;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Row(
        children: <Widget>[
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOutCirc,
            height: double.infinity,
            width: MediaQuery.of(context).size.width * 0.085,
            color: sideBarColor,
            child: RotatedBox(
              quarterTurns: -1,
              child: PageViewIndicator(
                activePage: currentPageValue,
                callback: (int index) {
                  controller.animateToPage(index,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOutCirc);
                },
              ),
            ),
          ),
          Expanded(
            child: PageView(
              controller: controller,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              onPageChanged: (int page) {
                currentPageValue = page;
                page == 2
                    ? sideBarColor = Color(0xFFc34372)
                    : sideBarColor = Colors.transparent;
                setState(() {});
              },
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
