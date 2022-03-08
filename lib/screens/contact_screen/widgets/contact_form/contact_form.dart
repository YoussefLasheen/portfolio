import 'package:flutter/material.dart';
import 'package:portfolio/screens/about_screen/sections/welcome_section.dart';
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
    Map message = {
      'name':'',
      'email':'',
      'subject':'',
      'budget':'',
      'messageText':'',
    };
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
                    validator: (val) => val!.isEmpty ? 'Name is required' : null,
                    onSaved: (val) => message['name'] = val,
                  ),
                ),
                Expanded(
                  child: AnimTFF(
                    labelText: 'Email',
                    inputIcon: Icon(Icons.email),
                    validator: (val) {
                      if (val == null ||
                          val.isEmpty ||
                          !RegExp(p).hasMatch(val)) {
                        return 'Email not Valid';
                      }
                      return null;
                    },
                    onSaved: (val) => message['email'] = val,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: AnimTFF(
              labelText: 'Subject',
              inputIcon: Icon(Icons.subject),
              validator: (val) => val!.isEmpty ? 'Subject is required' : null,
              onSaved: (val) => message['subject'] = val,
            ),
          ),
          Flexible(
            child: AnimTFF(
              maxLines: 5,
              labelText: 'Message Text',
              inputIcon: Icon(Icons.message),
              validator: (val) => val!.isEmpty ? 'Message is required' : null,
              onSaved: (val) => message['messageText'] = val,
            ),
          ),
          !isLandscape?
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 70, maxWidth: 150),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: ColoredButton(
                      onPressed: () {
                        final form = _formKey.currentState!;
                      if (form.validate()) {
                        form.save();
                        sendEmail(message);
                        form.reset();}
                      },
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Text(
                            'Send',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20),
                          ),
                        ),
                    ),
                  ),
                ),
          ):
          Align(
            alignment: Alignment.centerRight,
            child: ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 70, maxWidth: 150),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: ColoredButton(
                      onPressed: () {
                        final form = _formKey.currentState!;
                      if (form.validate()) {
                        form.save();
                        sendEmail(message);
                        form.reset();}
                      },
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Text(
                            'Send',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20),
                          ),
                        ),
                    ),
                  ),
                ),
          ),
        ],
      ),
    );
  }

  void sendEmail(message) {
    Message(
      name: message['name'],
      email: message['email'],
      subject: message['subject'],
      budget: message['budget'],
      messageText: message['messageText'],
    ).send();

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