import 'package:flutter/material.dart';
import 'package:portfolio/assets/constants.dart';
import 'package:portfolio/screens/contact_screen/widgets/contact_form/contact_form.dart';
import 'package:portfolio/screens/contact_screen/widgets/contact_links/contact_links.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    double screenHeight = MediaQuery.of(context).size.height;
    final ScrollController _scrollController = ScrollController();
    return SingleChildScrollView(
      controller: _scrollController,
      physics: isLandscape
          ? NeverScrollableScrollPhysics()
          : BouncingScrollPhysics(),
      child: SizedBox(
        height: isLandscape ? screenHeight : screenHeight * 2,
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
              flex: isLandscape?1: 2,
              child: Container(
                decoration: BoxDecoration(
                  gradient: mainGradient
                ),
                constraints: BoxConstraints.expand(),
                child: Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: isLandscape
                        ? EdgeInsets.symmetric(horizontal: 100.0)
                        : EdgeInsets.zero,
                    child: ContactLinks(),
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
