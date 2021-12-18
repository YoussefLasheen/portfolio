import 'package:flutter/material.dart';
import 'package:portfolio/assets/constants.dart';
import 'package:portfolio/screens/contact_screen/widgets/contact_form/contact_form.dart';
import 'package:portfolio/screens/contact_screen/widgets/contact_links/contact_links.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    double screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      physics: isLandscape
          ? NeverScrollableScrollPhysics()
          : BouncingScrollPhysics(),
      child: SizedBox(
        height: isLandscape ? screenHeight : screenHeight * 1.25,
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
                decoration: BoxDecoration(
                  gradient: mainGradient
                ),
                constraints: BoxConstraints.expand(),
                child: Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: screenHeight * 0.5,
                    child: Padding(
                      padding: isLandscape
                          ? EdgeInsets.symmetric(horizontal: 100.0)
                          : EdgeInsets.symmetric(horizontal: 20),
                      child: ContactLinks(),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
