import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String hintText;
  final bool isMultiLine;
  const TextInput({Key key, this.hintText, this.isMultiLine = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: TextField(
        maxLines: isMultiLine?10:1,
        style: TextStyle(color: Colors.black87),
        decoration: new InputDecoration(
            border: new OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: const BorderRadius.all(
                const Radius.circular(10.0),
              ),
            ),
            filled: true,
            hintStyle: new TextStyle(color: Colors.grey[800]),
            hintText: hintText,
            fillColor: Colors.white),
      ),
    );
  }
}
