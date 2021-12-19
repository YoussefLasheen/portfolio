import 'package:flutter/material.dart';
import 'package:portfolio/assets/constants.dart';

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        SizedBox(width: 10,),
        GestureDetector(
            onTap: () => callback(keysList[2]),
            child: circleBar(activePage == keysList[2], list[2], isLandscape, 50)),
        SizedBox(
          width: 25,
        ),
        GestureDetector(
            onTap: () => callback(keysList[1]),
            child: circleBar(activePage == keysList[1], list[1], isLandscape, 80)),
                    SizedBox(
          width: 25,
        ),
        GestureDetector(
            onTap: () => callback(keysList[0]),
            child: circleBar(activePage == keysList[0], list[0], isLandscape, 70.0)),
        SizedBox(width: 10,),
      ],
    );
  }
}

Widget circleBar(bool isActive, String content, bool isLandscape, double underLineWidth) {
  return Column(
    children: <Widget>[
      Text(
        content,
        style: TextStyle(color: isActive ? Colors.white : Colors.white70, fontSize: 20),
      ),
      AnimatedContainer(
        duration: Duration(milliseconds: 150),
        margin: EdgeInsets.symmetric(horizontal: 8),
        height: 4,
        width: underLineWidth,
        color: isActive ? mainColor : Colors.transparent,
      ),
    ],
  );
}
