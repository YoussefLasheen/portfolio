import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class WelcomeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.expand(height: 400),
      child: Row(
        children: [
          Expanded(
            child: SizedBox.expand(
              child: AutoSizeText(
                'Turn your \namazing ideas \ninto reality',
                style: TextStyle(fontSize: 90),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50,),
                Text(
                  'Book an evaluation now for free. And get a price quote the same day guarnteed',
                  style: TextStyle(color: Colors.white70, fontSize: 24),
                ),
                SizedBox(height: 5,),
                Text(
                  'Special prices for NPOs',
                  style: TextStyle(color: Colors.white54),
                ),
                SizedBox(height: 70,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ColoredButton(
                      text: 'ABOUT US',
                      color: Color(0xFF323941),
                      onPressed: null,
                    ),
                    SizedBox(width: 10,),
                    ColoredButton(
                      text: 'VIEW WORK',
                      color: Colors.deepPurple,
                      onPressed: null,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ColoredButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function onPressed;

  const ColoredButton({Key key, this.color, this.onPressed, this.text})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(1500.0),
        ),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
