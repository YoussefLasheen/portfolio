import 'package:flutter/material.dart';

class PageViewIndicator extends StatelessWidget {
  final int activePage;
  final void Function(int) callback;

  const PageViewIndicator({Key key, this.activePage, this.callback}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<String> list = ['ABOUT', 'PROJECTS', 'CONTACT'];
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.width * 0.028,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(
              flex: 4,
            ),
            GestureDetector(onTap:()=>callback(2),child: circleBar(activePage == 2, list[2])),
            Spacer(),
            GestureDetector(onTap:()=>callback(1),child: circleBar(activePage == 1, list[1])),
            Spacer(),
            GestureDetector(onTap:()=>callback(0),child: circleBar(activePage == 0, list[0])),
            Spacer(
              flex: 4,
            ),
          ],
        ),
      ),
    );
  }
}

Widget circleBar(bool isActive, String content) {
  return Column(
    children: <Widget>[
      Spacer(),
      Expanded(
        flex: 6,
        child: Text(
          content,
          style: TextStyle(color: isActive ? Colors.white : Colors.white70),
        ),
      ),
      Spacer(flex: 2,),
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
