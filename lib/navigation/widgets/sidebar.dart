import 'package:flutter/material.dart';

import 'pageview_indicator.dart';

class Sidebar extends StatefulWidget {
  Sidebar({Key key, this.control}) : super(key: key);
  final PageController control;

  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  int currentPageValue = 0;
  Color sideBarColor = Colors.transparent;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
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
            currentPageValue = index;
            widget.control.animateToPage(index,
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOutCirc);
            setState(() {});
          },
        ),
      ),
    );
  }
}
