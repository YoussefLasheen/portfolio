import 'package:flutter/material.dart';
import 'package:portfolio/screens/contact_screen/widgets/contact_form/contact_form.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: SizedBox(
        height: isLandscape
            ? MediaQuery.of(context).size.height
            : MediaQuery.of(context).size.height * 1.25,
        child: Flex(
          direction: isLandscape ? Axis.horizontal : Axis.vertical,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: isLandscape
                    ? EdgeInsets.only(right: 100.0)
                    : EdgeInsets.symmetric(horizontal: 20),
                child: ContactForm(),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.pink,
                constraints: BoxConstraints.expand(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
