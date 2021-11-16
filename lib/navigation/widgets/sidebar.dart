import 'package:flutter/material.dart';

import 'pageview_indicator.dart';

class Sidebar extends StatefulWidget {
  Sidebar({Key key, this.currentIndex, this.onTap}) : super(key: key);

  final int currentIndex;
  final Function onTap;

  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
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
          activePage: widget.currentIndex,
          callback: (int index) {
            widget.onTap(index);
          },
        ),
      ),
    );
  }
}
