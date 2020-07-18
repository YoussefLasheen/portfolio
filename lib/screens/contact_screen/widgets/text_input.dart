import 'package:flutter/material.dart';
import 'package:portfolio/screens/contact_screen/models/message.dart';

class ContactForm extends StatelessWidget {
  static var _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    Message message = Message();
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: SizedBox(
        height: isLandscape
            ? MediaQuery.of(context).size.height * 0.9
            : MediaQuery.of(context).size.height,
        child: Row(
          children: <Widget>[
            Spacer(
              flex: isLandscape ? 3 : 1,
            ),
            Expanded(
              flex: 10,
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Spacer(
                      flex: isLandscape ? 2 : 4,
                    ),
                    Expanded(
                      child: FittedBox(child: Text("Get in touch")),
                    ),
                    Spacer(),
                    Expanded(
                      flex: isLandscape ? 2 : 6,
                      child: Flex(
                        direction:
                            isLandscape ? Axis.horizontal : Axis.vertical,
                        children: <Widget>[
                          Expanded(
                            flex: 15,
                            child: TextFormField(
                              style: inputTextStyle,
                              decoration: inputDecoration.copyWith(
                                  hintText: 'Your Name'),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter your Name';
                                }
                              },
                              onSaved: (String value) {
                                message.name = value;
                              },
                            ),
                          ),
                          isLandscape?Spacer():Container(),
                          Expanded(
                            flex: 15,
                            child: TextFormField(
                              style: inputTextStyle,
                              decoration: inputDecoration.copyWith(
                                  hintText: 'Email Address'),
                              validator: (String value) {
                                if (!RegExp(
                                        r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                                    .hasMatch(value)) {
                                  return 'This is not a valid email';
                                }
                              },
                              onSaved: (String value) {
                                message.email = value;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(height: 5,),
                    Expanded(
                      flex: isLandscape ? 2 : 6,
                      child: Flex(
                        direction:
                            isLandscape ? Axis.horizontal : Axis.vertical,
                        children: <Widget>[
                          Expanded(
                            flex: 15,
                            child: TextFormField(
                              style: inputTextStyle,
                              decoration:
                                  inputDecoration.copyWith(hintText: 'Website'),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter your Website';
                                }
                              },
                              onSaved: (String value) {
                                message.website = value;
                              },
                            ),
                          ),
                          isLandscape?Spacer():Container(),
                          Expanded(
                            flex: 15,
                            child: TextFormField(
                              style: inputTextStyle,
                              decoration:
                                  inputDecoration.copyWith(hintText: 'Budget'),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter your Budget';
                                }
                              },
                              onSaved: (String value) {
                                message.budget = value;
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(height: 5,),
                    Expanded(
                      flex: 6,
                      child: TextFormField(
                        style: inputTextStyle,
                        decoration:
                            inputDecoration.copyWith(hintText: 'Message text'),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your Message';
                          }
                        },
                        onSaved: (String value) {
                          message.messageText = value;
                        },
                        maxLines: 10,
                      ),
                    ),
                    isLandscape?Container(height: 5,):Spacer(),
                    Expanded(
                      flex: 2,
                      child: SizedBox.expand(
                        child: FlatButton(
                          onPressed: () {
                            final form = _formKey.currentState;
                            if (form.validate()) {
                              form.save();
                              message.send(message);
                              form.reset();
                            }
                          },
                          child: Text("Send"),
                          color: Color(0xFF323941),
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                    ),
                    Spacer(
                      flex: isLandscape ? 2 : 6,
                    )
                  ],
                ),
              ),
            ),
            Spacer(flex: isLandscape ? 3 : 1)
          ],
        ),
      ),
    );
  }
}

InputDecoration inputDecoration = InputDecoration(
    focusedBorder: new OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF323941), width: 4),
      borderRadius: const BorderRadius.all(
        const Radius.circular(10.0),
      ),
    ),
    enabledBorder: new OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF323941), width: 2),
      borderRadius: const BorderRadius.all(
        const Radius.circular(10.0),
      ),
    ),
    errorBorder: new OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 4),
      borderRadius: const BorderRadius.all(
        const Radius.circular(10.0),
      ),
    ),
    focusedErrorBorder: new OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 6),
      borderRadius: const BorderRadius.all(
        const Radius.circular(10.0),
      ),
    ),
    filled: true,
    hintStyle: new TextStyle(color: Colors.grey[800]),
    fillColor: Colors.white,
    errorStyle: TextStyle(height: 0));

TextStyle inputTextStyle = TextStyle(color: Colors.black);
