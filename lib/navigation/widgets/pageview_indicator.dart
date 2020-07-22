import 'package:flutter/material.dart';

class PageViewIndicator extends StatelessWidget {
  final int activePage;
  final void Function(int) callback;

  const PageViewIndicator({Key key, this.activePage, this.callback})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    List<String> list = isLandscape
        ? ['ABOUT', 'PROJECTS', 'CONTACT']
        : ['CONTACT', 'PROJECTS', 'ABOUT'];
    List<int> keysList = isLandscape ? [0, 1, 2] : [2, 1, 0];
    return Center(
      child: Column(
        children: <Widget>[
          Spacer(),
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Spacer(
                  flex: 4,
                ),
                GestureDetector(
                    onTap: () => callback(keysList[2]),
                    child: circleBar(activePage == keysList[2], list[2], isLandscape)),
                Spacer(),
                GestureDetector(
                    onTap: () => callback(keysList[1]),
                    child: circleBar(activePage == keysList[1], list[1], isLandscape)),
                Spacer(),
                GestureDetector(
                    onTap: () => callback(keysList[0]),
                    child: circleBar(activePage == keysList[0], list[0], isLandscape)),
                Spacer(
                  flex: 4,
                ),
              ],
            ),
          ),
          Spacer()
        ],
      ),
    );
  }
}

Widget circleBar(bool isActive, String content, bool isLandscape) {
  return Column(
    children: <Widget>[
      Spacer(),
      Expanded(
        flex: isLandscape?3:8,
        child: FittedBox(
          child: Text(
            content,
            style: TextStyle(color: isActive ? Colors.white : Colors.white70),
          ),
        ),
      ),
      Spacer(
        flex: 2,
      ),
      Expanded(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 150),
          margin: EdgeInsets.symmetric(horizontal: 8),
          height: 4,
          width: 70,
          color: isActive ? Color(0xFFc34372) : Colors.transparent,
        ),
      ),
      Spacer()
    ],
  );
}
