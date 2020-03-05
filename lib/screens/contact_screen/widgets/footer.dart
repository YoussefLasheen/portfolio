import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 12,
      child: Container(
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
              child: Text(
                '2020 © Youssef Lasheen',
                style: TextStyle(color: Colors.black),
              ),
            ),
            Spacer(
              flex: 2,
            ),
            Expanded(
              flex: 2,
              child: Placeholder(),
            ),
            Spacer(
              flex: 2,
            ),
            Expanded(
              flex: 2,
              child: Text(
                "● ylasheen5@gmail.com",
                style: TextStyle(color: Colors.black),
              ),
            ),
            Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}
