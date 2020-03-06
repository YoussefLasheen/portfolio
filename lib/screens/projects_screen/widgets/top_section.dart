import 'package:flutter/material.dart';

class TopSection extends StatelessWidget {
  const TopSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      child: Column(
        children: <Widget>[
          Spacer(flex: 2),
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
                        flex: 4,
                        child: FittedBox(
                          child: Text(
                            '#Recent Work',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Spacer(),
                      Expanded(
                        flex: 6,
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
          Spacer(flex: 2)
        ],
      ),
    );
  }
}
