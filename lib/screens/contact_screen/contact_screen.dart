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
            child: ContactForm(),
          ),
          RotatedBox(quarterTurns: isLandscape ? 0 : -1, child: Footer())
        ],
      ),
    );
  }
}
