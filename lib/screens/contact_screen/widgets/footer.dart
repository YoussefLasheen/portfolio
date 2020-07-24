import 'package:flutter/material.dart';
import 'package:portfolio/screens/contact_screen/widgets/footer_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/images/FooterLogo.png'),
            ),
          ),
          Spacer(
            flex: 2,
          ),
          Expanded(
            flex: 2,
            child: FittedBox(
              child: Text(
                '2020 © Youssef Lasheen',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          Spacer(
            flex: 2,
          ),
          Expanded(
            flex: 2,
            child: FooterIcons(),
          ),
          Spacer(
            flex: 2,
          ),
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: ()async{
                String url = 'mailto:ylasheen5@gmail.com';
                if (await canLaunch(url)) {
                  await launch(url);
                  } else {
                    throw 'Could not launch $url';
                    }
              },
              child: FittedBox(
                child: Text(
                  "● ylasheen5@gmail.com",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
          Spacer(
            flex: 3,
          ),
        ],
      ),
    );
  }
}
