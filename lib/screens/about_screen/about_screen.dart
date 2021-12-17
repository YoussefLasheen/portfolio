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
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(right: 100, left: 50),
        child: Column(
          children: [
            SizedBox(height: 150,),
            WelcomeSection(),
            SizedBox(height: 150,),
            AboutusSection(),
            SizedBox(height: 150,),
            OurservicesSection(),
            SizedBox(height: 150,),
            CertificationsSection(),
            SizedBox(height: 150,),
            EndSection(),
            SizedBox(height: 150,),
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
