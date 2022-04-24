import 'package:flutter/material.dart';
import 'package:portfolio/assets/constants.dart';
import 'package:seo_renderer/seo_renderer.dart';

class BottomSection extends StatelessWidget {
  const BottomSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return SizedBox(
      height: isLandscape
          ? MediaQuery.of(context).size.height * (4 / 3)
          : MediaQuery.of(context).size.height * (2 / 4),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: mainColor,
        ),
        child: Center(
          child: Row(
            children: <Widget>[
              Spacer(),
              Expanded(
                flex: isLandscape ? 5 : 10,
                child: Column(
                  children: <Widget>[
                    Spacer(
                      flex: 2,
                    ),
                    Expanded(
                      flex: 6,
                      child: Placeholder(),
                    ),
                    Spacer(),
                    Expanded(
                      flex: 6,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: FittedBox(
                              child: TextRenderer(child: Text("Have an intersting project?")),
                            ),
                          ),
                          Expanded(
                            child: FittedBox(
                              child: TextRenderer(
                                child: Text(
                                  "No matter what it is you're after, contact me today to discuss further",
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white70),
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          Expanded(
                            flex: isLandscape? 1:2,
                            child: Center(
                              child: FractionallySizedBox(
                                widthFactor: isLandscape ? 5 / 12 : 3 / 4,
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 3,
                                      child: SizedBox.expand(
                                        child: TextField(
                                          style:
                                              TextStyle(color: Colors.black87),
                                          decoration: new InputDecoration(
                                              border: new OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft:
                                                      const Radius.circular(
                                                          50.0),
                                                  bottomLeft:
                                                      const Radius.circular(
                                                          50.0),
                                                ),
                                              ),
                                              filled: true,
                                              hintStyle: new TextStyle(
                                                  color: Colors.grey[800]),
                                              hintText: "Your Email",
                                              fillColor: Colors.white),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: SizedBox.expand(
                                        child: FlatButton(
                                          onPressed: () {},
                                          color: Colors.cyan,
                                          child: FittedBox(
                                            child: Text(
                                              "GO",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                const BorderRadius.only(
                                              bottomRight:
                                                  const Radius.circular(50.0),
                                              topRight:
                                                  const Radius.circular(50.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Spacer()
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
