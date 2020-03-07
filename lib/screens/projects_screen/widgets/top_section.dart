import 'package:flutter/material.dart';

class TopSection extends StatelessWidget {
  const TopSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return SizedBox(
      height: isLandscape?MediaQuery.of(context).size.height / 2:MediaQuery.of(context).size.height / 4,
      child: Column(
        children: <Widget>[
          Spacer(),
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
                        flex: 2,
                        child: FittedBox(
                          child: Text(
                            '#Recent Work',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Spacer(),
                      Flexible(
                        flex: 3,
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
          Spacer(flex: 2,)
        ],
      ),
    );
  }
}
