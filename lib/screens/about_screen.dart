import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Spacer(
                flex: 3,
              ),
              Expanded(
                flex: 5,
                child: FittedBox(
                  child: Text(
                    "Hello, I'm\nYoussef Lasheen",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: FittedBox(
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n Nunc sed rhoncus neque. Pellentesque venenatis felis at \nrisus rutrum porttitor ac sed turpis.\n Praesent vel iaculis lacus. Mauris maximus\n quam congue neque tincidunt aliquam vel in sapien.',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: SizedBox.expand(
                        child: FlatButton(
                          onPressed: () {},
                          child: FittedBox(child: Text('Download CV')),
                          color: Color(0xFF323941),
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(50.0),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: FloatingActionButton(
                          onPressed: () {},
                          child: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                          ),
                          backgroundColor: Color(0xFFc34372),
                        ),
                      ),
                    ),
                    Spacer(
                      flex: 3,
                    )
                  ],
                ),
              ),
              Spacer(
                flex: 6,
              )
            ],
          ),
        ),
        Spacer(),
        Expanded(
          flex: 3,
          child: Column(
            children: <Widget>[
              Spacer(),
              Image.asset('assets/images/P1Logo.png'),
              Spacer(
                flex: 3,
              )
            ],
          ),
        ),
        Spacer()
      ],
    );
  }
}
