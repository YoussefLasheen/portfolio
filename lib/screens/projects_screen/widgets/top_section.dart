import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class TopSection extends StatelessWidget {
  const TopSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return SizedBox(
      height: isLandscape?MediaQuery.of(context).size.height / 2:MediaQuery.of(context).size.height / 4,
      child: Row(
        children: <Widget>[
          isLandscape? Container():Spacer(),
          Expanded(
            flex: isLandscape?10:15,
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
                              child: AutoSizeText(
                                '#Recent Work',
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 100),
                              ),
                            ),
                            Spacer(),
                            Expanded(
                              flex: 3,
                                child: AutoSizeText(
                                  'Here are a few of my projects, ranging from fully developed projects with demonstrations to Flutter packages.',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(color: Colors.white70, fontSize: 60,),
                                ),
                            ),
                          ],
                        ),
                      ),
                      if(isLandscape)
                      Spacer(
                        flex: 1,
                      ),
                      if(isLandscape)
                      Expanded(
                          flex: isLandscape?4:2,
                          child: Image.asset('assets/images/LLLogo.webp',fit: BoxFit.contain,)),
                      //Spacer()
                    ],
                  ),
                ),
                isLandscape? Spacer(flex: 2,): SizedBox.shrink(),
              ],
            ),
          ),
          isLandscape? Container():Spacer()
        ],
      ),
    );
  }
}
