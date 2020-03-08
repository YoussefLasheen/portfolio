import 'package:flutter/material.dart';
import 'package:portfolio/screens/contact_screen/widgets/footer.dart';
import 'package:portfolio/screens/contact_screen/widgets/text_input.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Container(
      color: Color(0xFFc34372),
      child: Flex(
        direction: isLandscape ? Axis.vertical : Axis.horizontal,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Spacer(flex: isLandscape?3:1,),
                Expanded(
                  flex: 10,
                  child: Column(
                    children: <Widget>[
                      Spacer(
                        flex: isLandscape? 2:4,
                      ),
                      Expanded(
                        child: FittedBox(child: Text("Get in touch")),
                      ),
                      Spacer(),
                      Expanded(
                        flex: isLandscape? 2:6,
                        child: Flex(
                          direction: isLandscape?Axis.horizontal:Axis.vertical,
                          children: <Widget>[
                            Expanded(
                              flex: 15,
                              child: TextInput(
                                hintText: 'Your Name',
                              ),
                            ),
                            Spacer(),
                            Expanded(
                              flex: 15,
                              child: TextInput(
                                hintText: 'Email Address',
                              ),
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                      Expanded(
                        flex: isLandscape? 2:6,
                        child: Flex(
                          direction: isLandscape?Axis.horizontal:Axis.vertical,
                          children: <Widget>[
                            Expanded(
                              flex: 15,
                              child: TextInput(
                                hintText: 'Website',
                              ),
                            ),
                            Spacer(),
                            Expanded(
                              flex: 15,
                              child: TextInput(
                                hintText: 'Budget',
                              ),
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                      Expanded(
                        flex: 6,
                        child: TextInput(
                          hintText: 'Message text',
                          isMultiLine: true,
                        ),
                      ),
                      Spacer(),
                      Expanded(
                        flex: 2,
                        child: SizedBox.expand(
                          child: FlatButton(
                            onPressed: () {},
                            child: Text("Send"),
                            color: Color(0xFF323941),
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(5.0),
                            ),
                          ),
                        ),
                      ),
                      Spacer(
                        flex: isLandscape? 2:6,
                      )
                    ],
                  ),
                ),
                Spacer(flex: isLandscape?3:1)
              ],
            ),
          ),
          RotatedBox(quarterTurns: isLandscape?0:-1,child: Footer())
        ],
      ),
    );
  }
}
