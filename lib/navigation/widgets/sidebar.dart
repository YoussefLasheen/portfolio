import 'package:flutter/material.dart';

import 'pageview_indicator.dart';

class Sidebar extends StatefulWidget {
  Sidebar({Key? key, this.currentIndex, this.onTap}) : super(key: key);

  final int? currentIndex;
  final Function? onTap;

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
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 60, bottom: 45),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 50, maxWidth: 500),
            child: PageViewIndicator(
              activePage: widget.currentIndex,
              callback: (int index) {
                widget.onTap!(index);
              },
            ),
          ),
        ),
      ),
    );
  }
}
