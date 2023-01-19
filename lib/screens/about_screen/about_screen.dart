import 'package:flutter/material.dart';
import 'package:portfolio/screens/about_screen/sections/aboutus_section.dart';
import 'package:portfolio/screens/about_screen/sections/certificates_section.dart';
import 'package:portfolio/screens/about_screen/sections/end_section.dart';
import 'package:portfolio/screens/about_screen/sections/ourservices_section.dart';

import 'package:portfolio/screens/about_screen/sections/welcome_section.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    SizedBox _buildSpacer() => SizedBox(
          height: isLandscape ? 200 : 50,
        );
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: ListView.separated(
        itemCount: 6,
        separatorBuilder: (context, index) =>
            index != 5 ? _buildSpacer() : SizedBox.shrink(),
        itemBuilder: (context, index) {
          switch (index) {
            case 0:
              return SizedBox.shrink();
            case 1:
              return WelcomeSection();
            case 2:
              return AboutusSection();
            case 3:
              return OurservicesSection();
            case 4:
              return CertificatesSection();
            case 5:
              return EndSection();
            default:
              return SizedBox.shrink();
          }
        },
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(_, child, __) => child;
}
