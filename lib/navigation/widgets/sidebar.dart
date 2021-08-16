import 'package:flutter/material.dart';

import 'pageview_indicator.dart';

class Sidebar extends StatefulWidget {
  Sidebar(this.navigatorKey);
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  int currentPageValue = 0;
  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return RotatedBox(
      quarterTurns: isLandscape ? -1 : 0,
      child: Container(
        height: isLandscape
            ? MediaQuery.of(context).size.width * 0.085
            : MediaQuery.of(context).size.height * 0.1,
        width: double.infinity,
        color: Colors.transparent,
        child: PageViewIndicator(
          activePage: currentPageValue,
          callback: (int index) {
            if (currentPageValue != index) {
              currentPageValue = index;
              widget.navigatorKey.currentState
                  .pushReplacementNamed(indexToRoute(index));
              setState(() {});
            }
          },
        ),
      ),
    );
  }
}

String indexToRoute(int index) {
  switch (index) {
    case 0:
      return '/';
      break;
    case 1:
      return '/projects';
      break;
    case 2:
      return '/contact';
      break;
  }
}
