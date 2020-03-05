import 'package:flutter/material.dart';
import 'package:portfolio/screens/contact_screen/widgets/footer.dart';
import 'package:portfolio/screens/contact_screen/widgets/text_input.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFc34372),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * (9 / 16),
                child: Column(
                  children: <Widget>[
                    Spacer(
                      flex: 2,
                    ),
                    Expanded(
                      child: FittedBox(child: Text("Get in touch")),
                    ),
                    Spacer(),
                    Expanded(
                      flex: 2,
                      child: Row(
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
                      flex: 2,
                      child: Row(
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
                      child: FlatButton(
                        onPressed: () {},
                        child: Text("Send"),
                        color: Color(0xFF323941),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                    Spacer(
                      flex: 2,
                    )
                  ],
                ),
              ),
            ),
          ),
          Footer()
        ],
      ),
    );
  }
}
