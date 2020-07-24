import 'package:flutter/material.dart';
import 'package:portfolio/screens/contact_screen/widgets/footer.dart';
import 'package:portfolio/screens/contact_screen/widgets/portrait_footer.dart';
import 'package:portfolio/screens/contact_screen/widgets/text_input.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Container(
      color: Color(0xFFc34372),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SizedBox(
          height: isLandscape
              ? MediaQuery.of(context).size.height
              : MediaQuery.of(context).size.height * 1.25,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: isLandscape?20:20,
                child: ContactForm(),
              ),
              Expanded(flex: isLandscape?2:10, child: isLandscape?Footer():PortraitFooter()),
            ],
          ),
        ),
      ),
    );
  }
}
