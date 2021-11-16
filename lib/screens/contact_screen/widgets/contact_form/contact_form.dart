import 'package:flutter/material.dart';
import 'package:portfolio/screens/contact_screen/models/message.dart';
import 'package:portfolio/screens/contact_screen/widgets/contact_form/input.dart';

class ContactForm extends StatelessWidget {
  static var _formKey = GlobalKey<FormState>();
  static String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    Message message = Message();
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(
            child: Flex(
              direction: isLandscape ? Axis.horizontal : Axis.vertical,
              children: <Widget>[
                Expanded(
                  child: AnimTFF(
                    labelText: 'Name',
                    inputIcon: Icon(Icons.person),
                    validator: (val) => val.isEmpty ? 'Name is required' : null,
                  ),
                ),
                Expanded(
                  child: AnimTFF(
                    labelText: 'Email',
                    inputIcon: Icon(Icons.email),
                    validator: (val) {
                      if (val == null ||
                          val.isEmpty ||
                          RegExp(p).hasMatch(val)) {
                        return 'Email not Valid';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: AnimTFF(
              labelText: 'Subject',
              inputIcon: Icon(Icons.subject),
              validator: (val) => val.isEmpty ? 'Subject is required' : null,
            ),
          ),
          Flexible(
            child: AnimTFF(
              maxLines: 5,
              labelText: 'Message Text',
              inputIcon: Icon(Icons.message),
              validator: (val) => val.isEmpty ? 'Message is required' : null,
            ),
          ),
          !isLandscape?
          SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextButton(
                    
                    onPressed: () {
                      final form = _formKey.currentState;
                    if (form.validate()) {
                      form.save();
                      message.send(message);
                      form.reset();}
                    },
                    child: FittedBox(
                      child: Text("Send",style: TextStyle(color: Color(0xFFc34372)),),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.black26,
                    ),
                  ),
                ),
              ):
          Align(
            alignment: Alignment.centerRight,
            child: ConstrainedBox(
              constraints: BoxConstraints.expand(height: 50, width: 100),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () {
                    final form = _formKey.currentState;
                    if (form.validate()) {
                      form.save();
                      message.send(message);
                      form.reset();
                    }
                  },
                  child: Text(
                    "Send",
                    style: TextStyle(color: Color(0xFFc34372)),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black26,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
/*
InputDecoration inputDecoration = InputDecoration(
  focusedBorder: new OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFFc34372), width: 2),
  ),
  enabledBorder: new OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFF323941), width: 2),
  ),
  filled: true,
  hintStyle: new TextStyle(color: Colors.grey[800]),
  fillColor: Colors.white,
);

TextStyle inputTextStyle = TextStyle(color: Colors.black);
*/