import 'package:flutter/material.dart';
import 'package:portfolio/screens/about_screen/sections/aboutus_section.dart';
import 'package:portfolio/screens/about_screen/sections/end_section.dart';
import 'package:portfolio/screens/about_screen/sections/ourservices_section.dart';

import 'package:portfolio/screens/about_screen/sections/welcome_section.dart';

import 'sections/certificates_section.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    SizedBox _buildSpacer() => SizedBox(height: isLandscape? 150 : 50,);
    final ScrollController _scrollController = ScrollController();
    return SingleChildScrollView(
      controller: _scrollController,
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: isLandscape? EdgeInsets.only(right: 100, left: 50): EdgeInsets.all(20),
        child: Column(
          children: [
            _buildSpacer(),
            WelcomeSection(),
            _buildSpacer(),
            AboutusSection(),
            _buildSpacer(),
            OurservicesSection(),
            _buildSpacer(),
            CertificatesSection(),
            _buildSpacer(),
            EndSection(),
            _buildSpacer(),
          ],
        ),
      ),
    );
  }
}
