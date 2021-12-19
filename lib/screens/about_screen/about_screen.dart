import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/screens/about_screen/sections/aboutus_section.dart';
import 'package:portfolio/screens/about_screen/sections/certifications_section.dart';
import 'package:portfolio/screens/about_screen/sections/end_section.dart';
import 'package:portfolio/screens/about_screen/sections/ourservices_section.dart';

import 'package:portfolio/screens/about_screen/sections/welcome_section.dart';
import 'package:portfolio/services/api.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    SizedBox _buildSpacer() => SizedBox(height: isLandscape? 150 : 50,);
    return SingleChildScrollView(
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
            //CertificationsSection(),
            //_buildSpacer(),
            EndSection(),
            _buildSpacer(),
          ],
        ),
      ),
    );
  }
}

_launchURL() async {
  DocumentSnapshot snapshot = await Api('Data').getDocumentById('about_screen');
  String url = snapshot.get('CVDownloadURL');
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
